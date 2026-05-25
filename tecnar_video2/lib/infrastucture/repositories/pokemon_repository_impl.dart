import '../../domain/entities/pokemon.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../../domain/datasource/pokemon_datasource.dart';

class PokemonRepositoryImpl implements PokemonRepository {

  final PokemonDatasource datasource;

  PokemonRepositoryImpl(this.datasource);

  @override
  Future<Pokemon> getPokemon(String name) {

    return datasource.getPokemon(name);
  }
}