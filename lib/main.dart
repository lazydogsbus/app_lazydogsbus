import 'package:flutter/material.dart';
import 'package:lazydogsbus/travel_screen.dart'; // Importe a tela de Viagem
import 'package:lazydogsbus/city_search_screen.dart'; // Importe a tela de busca de cidades (necessário para TravelScreen)

void main() {
  runApp(const LazyDogsBusApp());
}

// Cores personalizadas
const Color kPrimaryColor = Color(0xFFB07A4A); // Um tom de marrom/caramelo
const Color kAccentColor = Color(0xFFE9D2B5); // Um bege areia claro
const Color kTextColor = Color(0xFF4A3728); // Um marrom escuro para textos
const Color kCardColor = Color(0xFFF3E2C5); // Um bege areia para fundos de cards

// Lista de países da América Latina (expandida)
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
  'Porto Rico', // Embora seja um território dos EUA, é culturalmente latino-americano
  'República Dominicana',
  'Uruguai',
  'Venezuela',
];

// Dados de exemplo para Estados e Cidades (expandidos para os principais países)
// Em um aplicativo real, isso viria de uma API ou banco de dados
const Map<String, List<String>> statesByCountry = {
  'Argentina': [
    'Buenos Aires', 'Catamarca', 'Chaco', 'Chubut', 'Córdoba', 'Corrientes',
    'Entre Ríos', 'Formosa', 'Jujuy', 'La Pampa', 'La Rioja', 'Mendoza',
    'Misiones', 'Neuquén', 'Río Negro', 'Salta', 'San Juan', 'San Luis',
    'Santa Cruz', 'Santa Fe', 'Santiago del Estero', 'Tierra del Fuego', 'Tucumán'
  ],
  'Bolívia': [
    'Beni', 'Chuquisaca', 'Cochabamba', 'La Paz', 'Oruro', 'Pando',
    'Potosí', 'Santa Cruz', 'Tarija'
  ],
  'Brasil': [
    'Acre', 'Alagoas', 'Amapá', 'Amazonas', 'Bahia', 'Ceará',
    'Distrito Federal', 'Espírito Santo', 'Goiás', 'Maranhão', 'Mato Grosso',
    'Mato Grosso do Sul', 'Minas Gerais', 'Pará', 'Paraíba', 'Paraná',
    'Pernambuco', 'Piauí', 'Rio de Janeiro', 'Rio Grande do Norte',
    'Rio Grande do Sul', 'Rondônia', 'Roraima', 'Santa Catarina',
    'São Paulo', 'Sergipe', 'Tocantins'
  ],
  'Chile': [
    'Arica y Parinacota', 'Tarapacá', 'Antofagasta', 'Atacama', 'Coquimbo',
    'Valparaíso', 'Metropolitana de Santiago', 'O\'Higgins', 'Maule',
    'Ñuble', 'Biobío', 'La Araucanía', 'Los Ríos', 'Los Lagos', 'Aysén',
    'Magallanes y la Antártica Chilena'
  ],
  'Colômbia': [
    'Amazonas', 'Antioquia', 'Arauca', 'Atlántico', 'Bolívar', 'Boyacá',
    'Caldas', 'Caquetá', 'Casanare', 'Cauca', 'Cesar', 'Chocó', 'Córdoba',
    'Cundinamarca', 'Guainía', 'Guaviare', 'Huila', 'La Guajira', 'Magdalena',
    'Meta', 'Nariño', 'Norte de Santander', 'Putumayo', 'Quindío', 'Risaralda',
    'San Andrés y Providencia', 'Santander', 'Sucre', 'Tolima',
    'Valle del Cauca', 'Vaupés', 'Vichada'
  ],
  'Costa Rica': [
    'Alajuela', 'Cartago', 'Guanacaste', 'Heredia', 'Limón', 'Puntarenas', 'San José'
  ],
  'Cuba': [
    'Artemisa', 'Camagüey', 'Ciego de Ávila', 'Cienfuegos', 'Granma',
    'Guantánamo', 'Holguín', 'Isla de la Juventud', 'La Habana', 'Las Tunas',
    'Matanzas', 'Mayabeque', 'Pinar del Río', 'Sancti Spíritus', 'Santiago de Cuba', 'Villa Clara'
  ],
  'Equador': [
    'Azuay', 'Bolívar', 'Cañar', 'Carchi', 'Chimborazo', 'Cotopaxi',
    'El Oro', 'Esmeraldas', 'Galápagos', 'Guayas', 'Imbabura', 'Loja',
    'Los Ríos', 'Manabí', 'Morona Santiago', 'Napo', 'Orellana', 'Pastaza',
    'Pichincha', 'Santa Elena', 'Santo Domingo de los Tsáchilas', 'Sucumbíos',
    'Tungurahua', 'Zamora Chinchipe'
  ],
  'El Salvador': [
    'Ahuachapán', 'Cabañas', 'Chalatenango', 'Cuscatlán', 'La Libertad',
    'La Paz', 'La Unión', 'Morazán', 'San Miguel', 'San Salvador',
    'San Vicente', 'Santa Ana', 'Sonsonate', 'Usulután'
  ],
  'Guatemala': [
    'Alta Verapaz', 'Baja Verapaz', 'Chimaltenango', 'Chiquimula', 'El Progreso',
    'Escuintla', 'Guatemala', 'Huehuetenango', 'Izabal', 'Jalapa', 'Jutiapa',
    'Petén', 'Quetzaltenango', 'Quiché', 'Retalhuleu', 'Sacatepéquez',
    'San Marcos', 'Santa Rosa', 'Sololá', 'Suchitepéquez', 'Totonicapán', 'Zacapa'
  ],
  'Honduras': [
    'Atlántida', 'Choluteca', 'Colón', 'Comayagua', 'Copán', 'Cortés',
    'El Paraíso', 'Francisco Morazán', 'Gracias a Dios', 'Intibucá', 'Islas de la Bahía',
    'La Paz', 'Lempira', 'Ocotepeque', 'Olancho', 'Santa Bárbara', 'Valle', 'Yoro'
  ],
  'México': [
    'Aguascalientes', 'Baja California', 'Baja California Sur', 'Campeche',
    'Chiapas', 'Chihuahua', 'Coahuila', 'Colima', 'Durango', 'Guanajuato',
    'Guerrero', 'Hidalgo', 'Jalisco', 'México', 'Michoacán', 'Morelos',
    'Nayarit', 'Nuevo León', 'Oaxaca', 'Puebla', 'Querétaro', 'Quintana Roo',
    'San Luis Potosí', 'Sinaloa', 'Sonora', 'Tabasco', 'Tamaulipas', 'Tlaxcala',
    'Veracruz', 'Yucatán', 'Zacatecas'
  ],
  'Nicarágua': [
    'Boaco', 'Carazo', 'Chinandega', 'Chontales', 'Estelí', 'Granada',
    'Jinotega', 'León', 'Madriz', 'Managua', 'Masaya', 'Matagalpa',
    'Nueva Segovia', 'Río San Juan', 'Rivas', 'Costa Caribe Norte', 'Costa Caribe Sur'
  ],
  'Panamá': [
    'Bocas del Toro', 'Chiriquí', 'Coclé', 'Colón', 'Darién', 'Herrera',
    'Los Santos', 'Panamá', 'Veraguas', 'Panamá Oeste'
  ],
  'Paraguai': [
    'Alto Paraguay', 'Alto Paraná', 'Amambay', 'Boquerón', 'Caaguazú',
    'Caazapá', 'Canindeyú', 'Canindeyú', 'Central', 'Concepción', 'Cordillera',
    'Guairá', 'Itapúa', 'Misiones', 'Ñeembucú', 'Paraguarí', 'Presidente Hayes',
    'San Pedro'
  ],
  'Peru': [
    'Amazonas', 'Áncash', 'Apurímac', 'Arequipa', 'Ayacucho', 'Cajamarca',
    'Callao', 'Cusco', 'Huancavelica', 'Huánuco', 'Ica', 'Junín', 'La Libertad',
    'Lambayeque', 'Lima', 'Loreto', 'Madre de Dios', 'Moquegua', 'Pasco',
    'Piura', 'Puno', 'San Martín', 'Tacna', 'Tumbes', 'Ucayali'
  ],
  'Porto Rico': [
    'Aguada', 'Aguadilla', 'Aguas Buenas', 'Aibonito', 'Añasco', 'Arecibo',
    'Arroyo', 'Barceloneta', 'Barranquitas', 'Bayamón', 'Cabo Rojo', 'Caguas',
    'Camuy', 'Canóvanas', 'Carolina', 'Cataño', 'Cayey', 'Ceiba', 'Ciales',
    'Cidra', 'Coamo', 'Comerío', 'Corozal', 'Culebra', 'Dorado', 'Fajardo',
    'Florida', 'Guánica', 'Guayama', 'Guayanilla', 'Guaynabo', 'Gurabo',
    'Hatillo', 'Hormigueros', 'Humacao', 'Isabela', 'Jayuya', 'Juana Díaz',
    'Juncos', 'Lajas', 'Lares', 'Las Marías', 'Las Piedras', 'Loíza',
    'Luquillo', 'Manatí', 'Maricao', 'Maunabo', 'Mayagüez', 'Moca',
    'Morovis', 'Naguabo', 'Naranjito', 'Orocovis', 'Patillas', 'Peñuelas',
    'Ponce', 'Quebradillas', 'Rincón', 'Río Grande', 'Sabana Grande',
    'Salinas', 'San Germán', 'San Juan', 'San Lorenzo', 'San Sebastián',
    'Santa Isabel', 'Toa Alta', 'Toa Baja', 'Trujillo Alto', 'Utuado',
    'Vega Alta', 'Vega Baja', 'Vieques', 'Villalba', 'Yabucoa', 'Yauco'
  ],
  'República Dominicana': [
    'Azua', 'Bahoruco', 'Barahona', 'Dajabón', 'Distrito Nacional', 'Duarte',
    'Elías Piña', 'El Seibo', 'Espaillat', 'Hato Mayor', 'Independencia',
    'La Altagracia', 'La Romana', 'La Vega', 'María Trinidad Sánchez', 'Monseñor Nouel',
    'Monte Cristi', 'Monte Plata', 'Pedernales', 'Peravia', 'Puerto Plata',
    'Samaná', 'San Cristóbal', 'San José de Ocoa', 'San Juan', 'San Pedro de Macorís',
    'Sánchez Ramírez', 'Santiago', 'Santiago Rodríguez', 'Santo Domingo', 'Valverde'
  ],
  'Uruguai': [
    'Artigas', 'Canelones', 'Cerro Largo', 'Colonia', 'Durazno', 'Flores',
    'Florida', 'Lavalleja', 'Maldonado', 'Montevideo', 'Paysandú', 'Río Negro',
    'Rivera', 'Rocha', 'Salto', 'San José', 'Soriano', 'Tacuarembó', 'Treinta y Tres'
  ],
  'Venezuela': [
    'Amazonas', 'Anzoátegui', 'Apure', 'Aragua', 'Barinas', 'Bolívar',
    'Carabobo', 'Cojedes', 'Delta Amacuro', 'Falcón', 'Guárico', 'Lara',
    'Mérida', 'Miranda', 'Monagas', 'Nueva Esparta', 'Portuguesa', 'Sucre',
    'Táchira', 'Trujillo', 'Vargas', 'Yaracuy', 'Zulia'
  ],
};

const Map<String, List<String>> citiesByState = {
  // --- Brasil ---
  'Acre': ['Rio Branco', 'Cruzeiro do Sul', 'Sena Madureira'],
  'Alagoas': ['Maceió', 'Arapiraca', 'Palmeira dos Índios'],
  'Amapá': ['Macapá', 'Santana', 'Laranjal do Jari'],
  'Amazonas': ['Manaus', 'Parintins', 'Itacoatiara'],
  'Bahia': ['Salvador', 'Feira de Santana', 'Vitória da Conquista', 'Camaçari'],
  'Ceará': ['Fortaleza', 'Caucaia', 'Juazeiro do Norte', 'Sobral'],
  'Distrito Federal': ['Brasília', 'Taguatinga', 'Ceilândia'],
  'Espírito Santo': ['Vitória', 'Vila Velha', 'Serra', 'Cariacica'],
  'Goiás': ['Goiânia', 'Aparecida de Goiânia', 'Anápolis', 'Rio Verde'],
  'Maranhão': ['São Luís', 'Imperatriz', 'São José de Ribamar'],
  'Mato Grosso': ['Cuiabá', 'Várzea Grande', 'Rondonópolis'],
  'Mato Grosso do Sul': ['Campo Grande', 'Dourados', 'Três Lagoas'],
  'Minas Gerais': ['Belo Horizonte', 'Uberlândia', 'Contagem', 'Juiz de Fora', 'Montes Claros', 'Ouro Preto'],
  'Pará': ['Belém', 'Ananindeua', 'Santarém', 'Marabá'],
  'Paraíba': ['João Pessoa', 'Campina Grande', 'Santa Rita'],
  'Paraná': ['Curitiba', 'Londrina', 'Maringá', 'Ponta Grossa', 'Cascavel'],
  'Pernambuco': ['Recife', 'Jaboatão dos Guararapes', 'Olinda', 'Caruaru'],
  'Piauí': ['Teresina', 'Parnaíba', 'Picos'],
  'Rio de Janeiro': ['Rio de Janeiro', 'Niterói', 'Duque de Caxias', 'São Gonçalo', 'Cabo Frio', 'Búzios'],
  'Rio Grande do Norte': ['Natal', 'Mossoró', 'Parnamirim'],
  'Rio Grande do Sul': ['Porto Alegre', 'Caxias do Sul', 'Pelotas', 'Canoas', 'Santa Maria'],
  'Rondônia': ['Porto Velho', 'Ji-Paraná', 'Ariquemes'],
  'Roraima': ['Boa Vista', 'Rorainópolis', 'Caracaraí'],
  'Santa Catarina': ['Florianópolis', 'Joinville', 'Blumenau', 'São José', 'Chapecó'],
  'São Paulo': ['São Paulo', 'Guarulhos', 'Campinas', 'São Bernardo do Campo', 'Santo André', 'Osasco', 'Ribeirão Preto', 'Santos', 'Sorocaba'],
  'Sergipe': ['Aracaju', 'Nossa Senhora do Socorro', 'Lagarto'],
  'Tocantins': ['Palmas', 'Araguaína', 'Gurupi'],

  // --- Argentina ---
  'Buenos Aires': ['Buenos Aires', 'La Plata', 'Mar del Plata', 'Bahía Blanca', 'Tandil'],
  'Córdoba': ['Córdoba', 'Río Cuarto', 'Villa Carlos Paz'],
  'Santa Fe': ['Rosario', 'Santa Fe', 'Rafaela'],
  'Mendoza': ['Mendoza', 'San Rafael', 'Godoy Cruz'],

  // --- México ---
  'Cidade do México': ['Cidade do México', 'Ecatepec de Morelos', 'Nezahualcóyotl', 'Naucalpan de Juárez'],
  'Jalisco': ['Guadalajara', 'Zapopan', 'Tlaquepaque'],
  'Nuevo León': ['Monterrey', 'Guadalupe', 'San Nicolás de los Garza'],
  'Veracruz': ['Veracruz', 'Xalapa', 'Coatzacoalcos'],

  // --- Colômbia ---
  'Antioquia': ['Medellín', 'Envigado', 'Itagüí'],
  'Cundinamarca': ['Bogotá', 'Soacha', 'Zipaquirá'],
  'Valle del Cauca': ['Cali', 'Buenaventura', 'Palmira'],

  // --- Chile ---
  'Metropolitana de Santiago': ['Santiago', 'Puente Alto', 'Maipú', 'La Florida'],
  'Valparaíso': ['Valparaíso', 'Viña del Mar', 'Quilpué'],
  'Biobío': ['Concepción', 'Talcahuano', 'Los Ángeles'],

  // --- Peru ---
  'Lima': ['Lima', 'Callao', 'Ate', 'San Juan de Lurigancho'],
  'Arequipa': ['Arequipa', 'Cayma', 'Cerro Colorado'],
  'Cusco': ['Cusco', 'Wanchaq', 'San Jerónimo'],

  // --- Outros Países (exemplos) ---
  'Uruguai': ['Montevideo', 'Salto', 'Paysandú'],
  'Paraguai': ['Assunção', 'Ciudad del Este', 'Encarnación'],
  'Equador': ['Quito', 'Guayaquil', 'Cuenca'],
  'Bolívia': ['La Paz', 'Santa Cruz de la Sierra', 'Cochabamba'],
  'Cuba': ['Havana', 'Santiago de Cuba', 'Camagüey'],
  'República Dominicana': ['Santo Domingo', 'Santiago de los Caballeros', 'San Pedro de Macorís'],
  'Venezuela': ['Caracas', 'Maracaibo', 'Valencia'],
  'Costa Rica': ['San José', 'Alajuela', 'Cartago'],
  'Panamá': ['Cidade do Panamá', 'Colón', 'David'],
  'Guatemala': ['Cidade da Guatemala', 'Quetzaltenango', 'Escuintla'],
  'El Salvador': ['San Salvador', 'Santa Ana', 'San Miguel'],
  'Honduras': ['Tegucigalpa', 'San Pedro Sula', 'La Ceiba'],
  'Nicarágua': ['Manágua', 'León', 'Masaya'],
  'Porto Rico': ['San Juan', 'Bayamón', 'Carolina'],
};

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
  Set<String> _selectedCountries = {'Brasil'}; // Inicia com Brasil selecionado por padrão

  // Função para mudar a aba selecionada
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Função para atualizar os países selecionados
  void _updateSelectedCountries(Set<String> newSelection) {
    setState(() {
      _selectedCountries = newSelection;
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
            icon: Icon(Icons.person_add),
            label: 'Cadastro',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Config',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Garante que todos os itens são visíveis
      ),
    );
  }
}

// --- TELAS PRINCIPAIS ---

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
          const _SectionTitle(title: 'Bem-vindo ao LazyDogsBus!'),
          const SizedBox(height: 12),
          Text(
            'Seu aplicativo para controle de viagens e gastos.',
            style: TextStyle(fontSize: 16, color: kTextColor.withOpacity(0.8)),
          ),
          const SizedBox(height: 20),
          const _SectionTitle(title: 'Acesso Rápido'),
          const SizedBox(height: 12),
          _QuickCard(
            title: 'Planejar Viagem',
            subtitle: 'Crie e gerencie suas rotas.',
            icon: Icons.map,
            onTap: () => onNavigate(1), // Navega para a aba Viagem
          ),
          _QuickCard(
            title: 'Registrar Gastos',
            subtitle: 'Controle suas despesas durante a viagem.',
            icon: Icons.payments,
            onTap: () => onNavigate(2), // Navega para a aba Gastos
          ),
          _QuickCard(
            title: 'Gerenciar Cadastros',
            subtitle: 'Adicione e edite clientes, empresas, etc.',
            icon: Icons.person_add,
            onTap: () => onNavigate(3), // Navega para a aba Cadastro
          ),
          _QuickCard(
            title: 'Configurações',
            subtitle: 'Ajuste as preferências do aplicativo.',
            icon: Icons.settings,
            onTap: () => onNavigate(4), // Navega para a aba Config
          ),
        ],
      ),
    );
  }
}

// A ViagemTab será fornecida separadamente, pois ela foi a que teve a maior alteração
// class ViagemTab extends StatefulWidget { ... }

class GastosTab extends StatelessWidget {
  const GastosTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SimplePage(
      title: 'Gastos',
      subtitle: 'Controle suas despesas de viagem.',
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
      subtitle: 'Gerencie seus clientes, empresas e usuários.',
      icon: Icons.person_add,
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
          const _SectionTitle(title: 'Configurações do Aplicativo'),
          const SizedBox(height: 12),
          _QuickCard(
            title: 'Gerenciar Países',
            subtitle: 'Selecione os países disponíveis para viagens.',
            icon: Icons.public,
            onTap: () async {
              final result = await Navigator.push<Set<String>>(
                context,
                MaterialPageRoute(
                  builder: (context) => CountrySelectionScreen(
                    initialSelectedCountries: initialSelectedCountries,
                  ),
                ),
              );
              if (result != null) {
                onCountriesUpdated(result);
              }
            },
          ),
          // Adicione outras opções de configuração aqui
          const SizedBox(height: 20),
          const _SectionTitle(title: 'Outras Configurações'),
          const SizedBox(height: 10),
          _QuickCard(
            title: 'Notificações',
            subtitle: 'Ajustar preferências de notificação.',
            icon: Icons.notifications_active,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Funcionalidade de Notificações em desenvolvimento.')),
              );
            },
          ),
          _QuickCard(
            title: 'Sobre o Aplicativo',
            subtitle: 'Informações da versão e licenças.',
            icon: Icons.info,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Funcionalidade "Sobre" em desenvolvimento.')),
              );
            },
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