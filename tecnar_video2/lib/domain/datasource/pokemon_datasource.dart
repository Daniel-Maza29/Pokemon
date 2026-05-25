import '../entities/pokemon.dart';

abstract class PokemonDatasource {
  Future<Pokemon> getPokemon(String name);
}