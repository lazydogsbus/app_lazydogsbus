import 'package:flutter/material.dart';

void main() {
  runApp(const LazyDogsBusApp());
}

// Cores personalizadas
const Color kPrimaryColor = Color(0xFFB07A4A); // Um tom de marrom/caramelo
const Color kAccentColor = Color(0xFFE9D2B5); // Um bege areia claro
const Color kTextColor = Color(0xFF4A3728); // Um marrom escuro para textos
const Color kCardColor = Color(0xFFF3E2C5); // Um bege areia para fundos de cards

// Lista de países da América Latina (para começar)
// Você pode expandir ou ajustar esta lista conforme necessário
const List<String> latinAmericanCountries = [
  'Argentina',
  'Bolívia',
  'Brasil',
  'Chile',
  'Colômbia',
  'Costa Rica',
  'Cuba',
  'Equador',
  'El Salvador',
  'Guatemala',
  'Honduras',
  'México',
  'Nicarágua',
  'Panamá',
  'Paraguai',
  'Peru',
  'República Dominicana',
  'Uruguai',
  'Venezuela',
];

class LazyDogsBusApp extends StatelessWidget {
  const LazyDogsBusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LazyDogsBus',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
        scaffoldBackgroundColor: kAccentColor, // Fundo geral do app
        appBarTheme: const AppBarTheme(
          backgroundColor: kPrimaryColor, // Cor da AppBar
          foregroundColor: Colors.white, // Cor do texto e ícones na AppBar
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: kTextColor,
          backgroundColor: kCardColor,
        ),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  Set<String> _selectedCountries = {'Brasil'}; // Padrão inicial: apenas Brasil

  // Função para mudar a aba selecionada
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Função para atualizar os países selecionados
  void _updateSelectedCountries(Set<String> newCountries) {
    setState(() {
      _selectedCountries = newCountries;
    });
  }

  @override
  Widget build(BuildContext context) {
    // As páginas agora recebem a função de navegação para os cards da Home
    final List<Widget> _pages = [
      HomeTab(onNavigate: _onItemTapped), // Passa a função para a HomeTab
      ViagemTab(selectedCountries: _selectedCountries), // Passa os países selecionados para ViagemTab
      const GastosTab(),
      const CadastroTab(),
      ConfigTab(onCountriesUpdated: _updateSelectedCountries, initialSelectedCountries: _selectedCountries),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('LazyDogsBus'),
        actions: [
          // Exemplo de botão de ação, se precisar no futuro
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notificações')),
              );
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus),
            label: 'Viagem',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payments),
            label: 'Gastos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.badge),
            label: 'Cadastro',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Config',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  final Function(int) onNavigate;

  const HomeTab({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Center(
            child: Column(
              children: [
                // Logo
                Image.asset(
                  'assets/logo.jpeg', // Certifique-se de que o caminho está correto
                  height: 100,
                ),
                const SizedBox(height: 16),
                const Text(
                  'LazyDogsBus',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: kTextColor,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Controle de viagens, gastos e cadastros em um só lugar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: kTextColor,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const _SectionTitle(title: 'Acessos rápidos'),
          const SizedBox(height: 12),
          _QuickCard(
            title: 'Viagem',
            subtitle: 'Criar, visualizar e acompanhar trajetos',
            icon: Icons.directions_bus,
            onTap: () => onNavigate(1), // Navega para a aba Viagem (índice 1)
          ),
          _QuickCard(
            title: 'Gastos',
            subtitle: 'Lançar e consultar despesas',
            icon: Icons.payments,
            onTap: () => onNavigate(2), // Navega para a aba Gastos (índice 2)
          ),
          _QuickCard(
            title: 'Cadastro',
            subtitle: 'Gerenciar usuários, empresas e clientes',
            icon: Icons.badge,
            onTap: () => onNavigate(3), // Navega para a aba Cadastro (índice 3)
          ),
          _QuickCard(
            title: 'Config',
            subtitle: 'Backup, versão e permissões',
            icon: Icons.settings,
            onTap: () => onNavigate(4), // Navega para a aba Config (índice 4)
          ),
          const SizedBox(height: 18),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: kCardColor,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFE9D2B5)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Últimas Viagens',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: kTextColor,
                  ),
                ),
                const SizedBox(height: 10),
                // Exemplo de item de viagem (pode ser um ListView.builder)
                ListTile(
                  leading: const Icon(Icons.alt_route, color: kPrimaryColor),
                  title: const Text('Viagem para São Paulo', style: TextStyle(color: kTextColor)),
                  subtitle: const Text('20/07/2026 - R\$ 500,00', style: TextStyle(color: kTextColor)),
                  trailing: const Icon(Icons.arrow_forward_ios, color: kTextColor),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Detalhes da viagem')),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.alt_route, color: kPrimaryColor),
                  title: const Text('Viagem para Rio de Janeiro', style: TextStyle(color: kTextColor)),
                  subtitle: const Text('15/07/2026 - R\$ 750,00', style: TextStyle(color: kTextColor)),
                  trailing: const Icon(Icons.arrow_forward_ios, color: kTextColor),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Detalhes da viagem')),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ViagemTab extends StatefulWidget {
  final Set<String> selectedCountries;

  const ViagemTab({super.key, required this.selectedCountries});

  @override
  State<ViagemTab> createState() => _ViagemTabState();
}

class _ViagemTabState extends State<ViagemTab> {
  String? _selectedOriginCountry;
  String? _selectedOriginState;
  String? _selectedOriginCity;

  String? _selectedDestinationCountry;
  String? _selectedDestinationState;
  String? _selectedDestinationCity;

  @override
  void initState() {
    super.initState();
    // Define 'Brasil' como padrão se estiver na lista de países selecionados
    if (widget.selectedCountries.contains('Brasil')) {
      _selectedOriginCountry = 'Brasil';
      _selectedDestinationCountry = 'Brasil';
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> availableCountries = widget.selectedCountries.toList()..sort();

    // Placeholder para estados e cidades (você precisará de uma lógica real para isso)
    final List<String> availableStates = _selectedOriginCountry == 'Brasil' ? ['São Paulo', 'Rio de Janeiro', 'Minas Gerais'] : [];
    final List<String> availableCities = _selectedOriginState == 'São Paulo' ? ['São Paulo', 'Campinas', 'Ribeirão Preto'] : [];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle(title: 'Planejar Nova Viagem'),
          const SizedBox(height: 20),

          // --- Seção de Origem ---
          const _SectionTitle(title: 'Origem'),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: kCardColor,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFE9D2B5)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Dropdown de País (Origem)
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'País',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  value: _selectedOriginCountry,
                  hint: const Text('Selecione o País'),
                  items: availableCountries.map((country) {
                    return DropdownMenuItem(
                      value: country,
                      child: Text(country),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedOriginCountry = newValue;
                      _selectedOriginState = null; // Reseta estado e cidade ao mudar o país
                      _selectedOriginCity = null;
                    });
                  },
                ),
                const SizedBox(height: 16),
                // Dropdown de Estado (Origem) - Placeholder
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Estado',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  value: _selectedOriginState,
                  hint: const Text('Selecione o Estado'),
                  items: availableStates.map((state) {
                    return DropdownMenuItem(
                      value: state,
                      child: Text(state),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedOriginState = newValue;
                      _selectedOriginCity = null; // Reseta cidade ao mudar o estado
                    });
                  },
                  // Desabilita se nenhum país for selecionado
                  isDense: true,
                  isExpanded: true,
                  menuMaxHeight: 200,
                  validator: (value) {
                    if (_selectedOriginCountry != null && value == null) {
                      return 'Por favor, selecione um estado';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 16),
                // Dropdown de Cidade (Origem) - Placeholder
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Cidade',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  value: _selectedOriginCity,
                  hint: const Text('Selecione a Cidade'),
                  items: availableCities.map((city) {
                    return DropdownMenuItem(
                      value: city,
                      child: Text(city),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedOriginCity = newValue;
                    });
                  },
                  // Desabilita se nenhum estado for selecionado
                  isDense: true,
                  isExpanded: true,
                  menuMaxHeight: 200,
                  validator: (value) {
                    if (_selectedOriginState != null && value == null) {
                      return 'Por favor, selecione uma cidade';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // --- Seção de Destino ---
          const _SectionTitle(title: 'Destino'),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: kCardColor,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFE9D2B5)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Dropdown de País (Destino)
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'País',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  value: _selectedDestinationCountry,
                  hint: const Text('Selecione o País'),
                  items: availableCountries.map((country) {
                    return DropdownMenuItem(
                      value: country,
                      child: Text(country),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedDestinationCountry = newValue;
                      _selectedDestinationState = null;
                      _selectedDestinationCity = null;
                    });
                  },
                ),
                const SizedBox(height: 16),
                // Dropdown de Estado (Destino) - Placeholder
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Estado',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  value: _selectedDestinationState,
                  hint: const Text('Selecione o Estado'),
                  items: availableStates.map((state) {
                    return DropdownMenuItem(
                      value: state,
                      child: Text(state),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedDestinationState = newValue;
                      _selectedDestinationCity = null;
                    });
                  },
                  isDense: true,
                  isExpanded: true,
                  menuMaxHeight: 200,
                  validator: (value) {
                    if (_selectedDestinationCountry != null && value == null) {
                      return 'Por favor, selecione um estado';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 16),
                // Dropdown de Cidade (Destino) - Placeholder
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Cidade',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  value: _selectedDestinationCity,
                  hint: const Text('Selecione a Cidade'),
                  items: availableCities.map((city) {
                    return DropdownMenuItem(
                      value: city,
                      child: Text(city),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedDestinationCity = newValue;
                    });
                  },
                  isDense: true,
                  isExpanded: true,
                  menuMaxHeight: 200,
                  validator: (value) {
                    if (_selectedDestinationState != null && value == null) {
                      return 'Por favor, selecione uma cidade';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Botão para Planejar Viagem
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                // Lógica para planejar a viagem
                if (_selectedOriginCountry != null &&
                    _selectedOriginState != null &&
                    _selectedOriginCity != null &&
                    _selectedDestinationCountry != null &&
                    _selectedDestinationState != null &&
                    _selectedDestinationCity != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Viagem de $_selectedOriginCity para $_selectedDestinationCity planejada!'),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Por favor, preencha todos os campos de origem e destino.'),
                    ),
                  );
                }
              },
              icon: const Icon(Icons.map),
              label: const Text('Planejar Viagem'),
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GastosTab extends StatelessWidget {
  const GastosTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SimplePage(
      title: 'Gastos',
      subtitle: 'Controle suas despesas de viagem',
      icon: Icons.payments,
    );
  }
}

class CadastroTab extends StatelessWidget {
  const CadastroTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SimplePage(
      title: 'Cadastro',
      subtitle: 'Gerencie usuários, empresas e clientes',
      icon: Icons.badge,
    );
  }
}

class ConfigTab extends StatelessWidget {
  final Function(Set<String>) onCountriesUpdated;
  final Set<String> initialSelectedCountries;

  const ConfigTab({
    super.key,
    required this.onCountriesUpdated,
    required this.initialSelectedCountries,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle(title: 'Configurações Gerais'),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: kCardColor,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFE9D2B5)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const Icon(Icons.public, color: kPrimaryColor),
                  title: const Text('Gerenciar Países', style: TextStyle(color: kTextColor)),
                  subtitle: const Text('Selecione os países disponíveis para viagens', style: TextStyle(color: kTextColor)),
                  trailing: const Icon(Icons.arrow_forward_ios, color: kTextColor),
                  onTap: () async {
                    final Set<String>? updatedCountries = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CountrySelectionScreen(
                          initialSelectedCountries: initialSelectedCountries,
                        ),
                      ),
                    );
                    if (updatedCountries != null) {
                      onCountriesUpdated(updatedCountries);
                    }
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.info, color: kPrimaryColor),
                  title: const Text('Sobre o Aplicativo', style: TextStyle(color: kTextColor)),
                  subtitle: const Text('Informações da versão e licenças', style: TextStyle(color: kTextColor)),
                  trailing: const Icon(Icons.arrow_forward_ios, color: kTextColor),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Informações do aplicativo')),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const _SectionTitle(title: 'Avançado'),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: kCardColor,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFE9D2B5)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const Icon(Icons.backup, color: kPrimaryColor),
                  title: const Text('Backup e Restauração', style: TextStyle(color: kTextColor)),
                  subtitle: const Text('Faça backup dos seus dados', style: TextStyle(color: kTextColor)),
                  trailing: const Icon(Icons.arrow_forward_ios, color: kTextColor),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Backup de dados')),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.security, color: kPrimaryColor),
                  title: const Text('Permissões e Segurança', style: TextStyle(color: kTextColor)),
                  subtitle: const Text('Gerencie as permissões do aplicativo', style: TextStyle(color: kTextColor)),
                  trailing: const Icon(Icons.arrow_forward_ios, color: kTextColor),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Permissões de segurança')),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Saindo do aplicativo...')),
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text('Sair'),
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CountrySelectionScreen extends StatefulWidget {
  final Set<String> initialSelectedCountries;

  const CountrySelectionScreen({
    super.key,
    required this.initialSelectedCountries,
  });

  @override
  State<CountrySelectionScreen> createState() => _CountrySelectionScreenState();
}

class _CountrySelectionScreenState extends State<CountrySelectionScreen> {
  late Set<String> _currentSelectedCountries;
  late bool _selectAllLatinAmerica;

  @override
  void initState() {
    super.initState();
    _currentSelectedCountries = Set.from(widget.initialSelectedCountries);
    _selectAllLatinAmerica = _currentSelectedCountries.containsAll(latinAmericanCountries);
  }

  void _toggleCountry(String country) {
    setState(() {
      if (_currentSelectedCountries.contains(country)) {
        _currentSelectedCountries.remove(country);
      } else {
        _currentSelectedCountries.add(country);
      }
      _selectAllLatinAmerica = _currentSelectedCountries.containsAll(latinAmericanCountries);
    });
  }

  void _toggleSelectAllLatinAmerica(bool value) {
    setState(() {
      _selectAllLatinAmerica = value;
      if (value) {
        _currentSelectedCountries.addAll(latinAmericanCountries);
      } else {
        _currentSelectedCountries.removeAll(latinAmericanCountries);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecionar Países'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionTitle(title: 'Países Disponíveis'),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: kCardColor,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFFE9D2B5)),
              ),
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text('América Latina (todos os países)', style: TextStyle(color: kTextColor)),
                    value: _selectAllLatinAmerica,
                    onChanged: _toggleSelectAllLatinAmerica,
                    activeColor: kPrimaryColor,
                  ),
                  const Divider(),
                  ...latinAmericanCountries.map((country) {
                    return SwitchListTile(
                      title: Text(country, style: const TextStyle(color: kTextColor)),
                      value: _currentSelectedCountries.contains(country),
                      onChanged: (bool value) {
                        _toggleCountry(country);
                      },
                      activeColor: kPrimaryColor,
                    );
                  }).toList(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, _currentSelectedCountries); // Retorna a seleção para a tela anterior
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Configurações de países salvas!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Salvar Seleção'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- WIDGETS REUTILIZÁVEIS ---

class _SimplePage extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _SimplePage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: kCardColor,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFFE9D2B5)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 42, color: kPrimaryColor),
              const SizedBox(height: 14),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: kTextColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: kTextColor,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onTap; // Adiciona um callback para o clique

  const _QuickCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // Usa GestureDetector para detectar o toque
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: kTextColor, // Fundo do card preto
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFF4A3728)), // Borda escura
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: kPrimaryColor, // Fundo do ícone
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: Colors.white, size: 28), // Ícone branco e maior
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.white, // Título branco
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white.withOpacity(0.8), // Subtítulo branco mais suave
                      height: 1.35,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: kTextColor,
      ),
    );
  }
}