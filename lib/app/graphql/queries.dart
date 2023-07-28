String queries = r'''
      query pokemons($first: Int!){
          pokemons(first: $first){
            id
            number
            name
            weight{
              minimum
              maximum
            }
            height{
              minimum
              maximum
            }
            classification
            types
            resistant
            weaknesses
            fleeRate
            maxCP
            maxHP
            image
          }
      }
    ''';
