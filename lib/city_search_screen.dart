import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Sua chave de API do Google Places
// Certifique-se de que esta chave está correta e habilitada para a API do Google Places
const String googleApiKey = 'AIzaSyC6U4zwghZQPY-EMlkmF0ZHw7X7kXQrxXw'; // <--- VERIFIQUE ESTA CHAVE

class CitySearchScreen extends StatefulWidget {
  const CitySearchScreen({super.key});

  @override
  State<CitySearchScreen> createState() => _CitySearchScreenState();
}

class _CitySearchScreenState extends State<CitySearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _suggestions = [];
  String _searchResult = '';

  @override
  void initState() {
    super.initState();
    // Adicione um print para a chave da API no início
    print('Google API Key carregada: $googleApiKey'); // <--- ADICIONE ESTA LINHA
  }

  Future<void> _searchCities(String query) async {
    // Adicione um print para confirmar que a função está sendo chamada
    print('Função _searchCities chamada com query: $query'); // <--- ADICIONE ESTA LINHA

    if (query.isEmpty) {
      setState(() {
        _suggestions = [];
        _searchResult = '';
      });
      return;
    }

    final url = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&language=pt_BR&key=$googleApiKey';
    print('Chamando API do Google Places com URL: $url');

    try {
      final response = await http.get(Uri.parse(url));

      print('Status da resposta da API: ${response.statusCode}');
      print('Corpo da resposta da API: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'OK') {
          setState(() {
            _suggestions = (data['predictions'] as List)
                .map((prediction) => prediction['description'] as String)
                .toList();
            _searchResult = '';
          });
        } else {
          setState(() {
            _suggestions = [];
            _searchResult = 'Erro na API: ${data['status']}';
            print('Erro na API do Google Places: ${data['status']} - ${data['error_message']}');
          });
        }
      } else {
        setState(() {
          _suggestions = [];
          _searchResult = 'Erro na requisição: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _suggestions = [];
        _searchResult = 'Erro de conexão: $e';
        print('Erro de conexão ao chamar API do Google Places: $e');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar Cidade'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Digite o nome da cidade',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    _searchCities('');
                  },
                ),
              ),
              onChanged: (value) => _searchCities(value), // Chama a busca ao digitar
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _searchCities(_searchController.text), // Chama a busca ao clicar no botão
                child: const Text('Buscar'),
              ),
            ),
            const SizedBox(height: 20),
            if (_searchResult.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  _searchResult,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: _suggestions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_suggestions[index]),
                    onTap: () {
                      Navigator.pop(context, _suggestions[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
