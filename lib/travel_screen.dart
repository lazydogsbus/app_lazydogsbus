import 'package:flutter/material.dart';
import 'package:lazydogsbus/city_search_screen.dart'; // Importe a tela de busca de cidades

// IMPORTANTE: As constantes como kPrimaryColor, latinAmericanCountries, statesByCountry, citiesByState
// JÁ ESTÃO DEFINIDAS NO SEU main.dart.
// NÃO AS COPIE PARA CÁ NOVAMENTE para evitar duplicação.
// Se você as copiou antes, remova-as deste arquivo.
// Para que este arquivo possa acessar essas constantes, certifique-se de que o main.dart
// está importando travel_screen.dart e que as constantes são globais ou acessíveis.

// Se as constantes não estiverem acessíveis aqui, você precisará importá-las de um arquivo de constantes
// ou passá-las como parâmetros. Por enquanto, assumimos que são acessíveis globalmente via main.dart.
// Exemplo de como acessar as constantes se elas estiverem em main.dart e main.dart for importado:
// import 'package:lazydogsbus/main.dart' as main_app; // Se precisar prefixar para evitar conflitos

// Para fins de demonstração e para que o código compile, vou incluir as constantes aqui.
// No seu projeto, o ideal é que elas venham de um arquivo de constantes compartilhado ou do main.dart.
const Color kPrimaryColor = Color(0xFFB07A4A); // Um tom de marrom/caramelo
const Color kAccentColor = Color(0xFFE9D2B5); // Um bege areia claro
const Color kTextColor = Color(0xFF4A3728); // Um marrom escuro para textos
const Color kCardColor = Color(0xFFF3E2C5); // Um bege areia para fundos de cards

const List<String> latinAmericanCountries = [
  'Argentina', 'Bolívia', 'Brasil', 'Chile', 'Colômbia', 'Costa Rica', 'Cuba',
  'Equador', 'El Salvador', 'Guatemala', 'Honduras', 'México', 'Nicarágua',
  'Panamá', 'Paraguai', 'Peru', 'Porto Rico', 'República Dominicana', 'Uruguai', 'Venezuela',
];

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
  'Santa Catarina': ['Florianópolis', 'Joinville', 'Blumenau', 'São José'],
  'São Paulo': ['São Paulo', 'Guarulhos', 'Campinas', 'São Bernardo do Campo', 'Santo André', 'Santos', 'Ribeirão Preto'],
  'Sergipe': ['Aracaju', 'Nossa Senhora do Socorro', 'Lagarto'],
  'Tocantins': ['Palmas', 'Araguaína', 'Gurupi'],

  // --- Argentina ---
  'Buenos Aires': ['Buenos Aires', 'La Plata', 'Mar del Plata'],
  'Córdoba': ['Córdoba', 'Río Cuarto', 'Villa Carlos Paz'],
  // ... adicione mais cidades para outros estados/países conforme necessário
};


class ViagemTab extends StatefulWidget {
  final Set<String> selectedCountries; // Recebe os países selecionados

  const ViagemTab({super.key, required this.selectedCountries});

  @override
  State<ViagemTab> createState() => _ViagemTabState();
}

class _ViagemTabState extends State<ViagemTab> {
  final TextEditingController _originController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();

  String? _selectedOriginCountry;
  String? _selectedOriginState;
  String? _selectedOriginCity;

  String? _selectedDestinationCountry;
  String? _selectedDestinationState;
  String? _selectedDestinationCity;

  @override
  void initState() {
    super.initState();
    // Define Brasil como padrão se estiver na lista de países selecionados
    if (widget.selectedCountries.contains('Brasil')) {
      _selectedOriginCountry = 'Brasil';
      _selectedDestinationCountry = 'Brasil';
    }
  }

  // Função para mostrar o trajeto no mapa (ainda um placeholder)
  void _showRoute() {
    if (_originController.text.isNotEmpty && _destinationController.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Mostrando trajeto de ${_originController.text} para ${_destinationController.text}')),
      );
      print('Mostrar trajeto de ${_originController.text} para ${_destinationController.text}');
      // TODO: Implementar a lógica real para mostrar o trajeto no mapa
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, selecione Origem e Destino.')),
      );
    }
  }

  // Função para salvar a viagem (ainda um placeholder)
  void _saveTrip() {
    if (_originController.text.isNotEmpty && _destinationController.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Viagem de ${_originController.text} para ${_destinationController.text} salva!')),
      );
      print('Salvar viagem de ${_originController.text} para ${_destinationController.text}');
      // TODO: Implementar a lógica real para salvar a viagem
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, selecione Origem e Destino antes de salvar.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Lista de países filtrada pelos países selecionados nas configurações
    final List<String> availableCountries = latinAmericanCountries
        .where((country) => widget.selectedCountries.contains(country))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Viagem'),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // --- Seção de Origem ---
            const _SectionTitle(title: 'Origem'),
            const SizedBox(height: 10),
            // Dropdown de País de Origem
            DropdownButtonFormField<String>(
              value: _selectedOriginCountry,
              decoration: const InputDecoration(
                labelText: 'País',
                border: OutlineInputBorder(),
              ),
              items: availableCountries.map((country) {
                return DropdownMenuItem(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOriginCountry = newValue;
                  _selectedOriginState = null; // Reseta estado e cidade
                  _selectedOriginCity = null;
                  _originController.clear(); // Limpa o campo de texto
                });
              },
              validator: (value) => value == null ? 'Selecione o país de origem' : null,
            ),
            const SizedBox(height: 10),
            // Dropdown de Estado de Origem
            DropdownButtonFormField<String>(
              value: _selectedOriginState,
              decoration: const InputDecoration(
                labelText: 'Estado',
                border: OutlineInputBorder(),
              ),
              items: _selectedOriginCountry != null && statesByCountry.containsKey(_selectedOriginCountry)
                  ? statesByCountry[_selectedOriginCountry]!.map((state) {
                      return DropdownMenuItem(
                        value: state,
                        child: Text(state),
                      );
                    }).toList()
                  : [],
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOriginState = newValue;
                  _selectedOriginCity = null; // Reseta a cidade
                  _originController.clear(); // Limpa o campo de texto
                });
              },
              validator: (value) => value == null ? 'Selecione o estado de origem' : null,
            ),
            const SizedBox(height: 10),
            // Dropdown de Cidade de Origem
            DropdownButtonFormField<String>(
              value: _selectedOriginCity,
              decoration: const InputDecoration(
                labelText: 'Cidade',
                border: OutlineInputBorder(),
              ),
              items: _selectedOriginState != null && citiesByState.containsKey(_selectedOriginState)
                  ? citiesByState[_selectedOriginState]!.map((city) {
                      return DropdownMenuItem(
                        value: city,
                        child: Text(city),
                      );
                    }).toList()
                  : [],
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOriginCity = newValue;
                  if (newValue != null) {
                    _originController.text = '$newValue, $_selectedOriginState, $_selectedOriginCountry';
                  } else {
                    _originController.clear();
                  }
                });
              },
              validator: (value) => value == null ? 'Selecione a cidade de origem' : null,
            ),
            const SizedBox(height: 10),
            // Campo de Origem (com busca)
            TextFormField(
              controller: _originController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Ou busque a Origem',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CitySearchScreen(),
                      ),
                    );
                    if (result != null && result is String) {
                      setState(() {
                        _originController.text = result;
                        // Ao selecionar por busca, limpa os dropdowns para evitar inconsistência
                        _selectedOriginCountry = null;
                        _selectedOriginState = null;
                        _selectedOriginCity = null;
                      });
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            // --- Seção de Destino ---
            const _SectionTitle(title: 'Destino'),
            const SizedBox(height: 10),
            // Dropdown de País de Destino
            DropdownButtonFormField<String>(
              value: _selectedDestinationCountry,
              decoration: const InputDecoration(
                labelText: 'País',
                border: OutlineInputBorder(),
              ),
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
                  _destinationController.clear();
                });
              },
              validator: (value) => value == null ? 'Selecione o país de destino' : null,
            ),
            const SizedBox(height: 10),
            // Dropdown de Estado de Destino
            DropdownButtonFormField<String>(
              value: _selectedDestinationState,
              decoration: const InputDecoration(
                labelText: 'Estado',
                border: OutlineInputBorder(),
              ),
              items: _selectedDestinationCountry != null && statesByCountry.containsKey(_selectedDestinationCountry)
                  ? statesByCountry[_selectedDestinationCountry]!.map((state) {
                      return DropdownMenuItem(
                        value: state,
                        child: Text(state),
                      );
                    }).toList()
                  : [],
              onChanged: (String? newValue) {
                setState(() {
                  _selectedDestinationState = newValue;
                  _selectedDestinationCity = null;
                  _destinationController.clear();
                });
              },
              validator: (value) => value == null ? 'Selecione o estado de destino' : null,
            ),
            const SizedBox(height: 10),
            // Dropdown de Cidade de Destino
            DropdownButtonFormField<String>(
              value: _selectedDestinationCity,
              decoration: const InputDecoration(
                labelText: 'Cidade',
                border: OutlineInputBorder(),
              ),
              items: _selectedDestinationState != null && citiesByState.containsKey(_selectedDestinationState)
                  ? citiesByState[_selectedDestinationState]!.map((city) {
                      return DropdownMenuItem(
                        value: city,
                        child: Text(city),
                      );
                    }).toList()
                  : [],
              onChanged: (String? newValue) {
                setState(() {
                  _selectedDestinationCity = newValue;
                  if (newValue != null) {
                    _destinationController.text = '$newValue, $_selectedDestinationState, $_selectedDestinationCountry';
                  } else {
                    _destinationController.clear();
                  }
                });
              },
              validator: (value) => value == null ? 'Selecione a cidade de destino' : null,
            ),
            const SizedBox(height: 10),
            // Campo de Destino (com busca)
            TextFormField(
              controller: _destinationController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Ou busque o Destino',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CitySearchScreen(),
                      ),
                    );
                    if (result != null && result is String) {
                      setState(() {
                        _destinationController.text = result;
                        // Ao selecionar por busca, limpa os dropdowns para evitar inconsistência
                        _selectedDestinationCountry = null;
                        _selectedDestinationState = null;
                        _selectedDestinationCity = null;
                      });
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            // --- Visualização do Mapa (Placeholder) ---
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.map, size: 50, color: Colors.grey),
                    SizedBox(height: 10),
                    Text(
                      'Espaço para o Mapa',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    Text(
                      '(Funcionalidade de mapa em desenvolvimento)',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // --- Botões de Ação ---
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _showRoute,
                icon: const Icon(Icons.alt_route),
                label: const Text('Mostrar Rota no Mapa'),
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
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _saveTrip,
                icon: const Icon(Icons.save),
                label: const Text('Salvar Viagem'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kTextColor, // Cor diferente para destacar
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
      ),
    );
  }
}

// Widget auxiliar para títulos de seção
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