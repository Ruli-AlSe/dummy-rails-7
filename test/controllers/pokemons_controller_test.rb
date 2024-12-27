require "test_helper"

class PokemonsControllerTest < ActionDispatch::IntegrationTest
  test "visiting the index" do
    get root_path

    assert_select "h1", text: "Pokemons Test"
  end

  test "search for an existing pokemon" do
    pokemon = pokemons(:charmander)
    params = {
      name: pokemon.name
    }

    assert_no_difference "Pokemon.count", "No new pokemons created" do
      post search_path, params: params

      assert_equal "charmander's number is 4", flash[:notice]
      assert_redirected_to root_path
    end
  end

  test "search for a new pokemon" do 
    params = {name: 'pikachu'}

    VCR.use_cassette("search_pikachu") do
      assert_difference "Pokemon.count" do
        # This is a way how to create a mock with mocha configured in test_helper
        # PokemonLocatorService.any_instance.expects(:call).returns(Pokemon.create(name: "pikachu", number: "25"))
        post search_path, params: params
      end
    end

    assert_equal "pikachu's number is 25", flash[:notice]
    assert_redirected_to root_path
  end

  test "search for an invalid pokemon" do 
    params = {name: 'pika'}

    VCR.use_cassette("search_pika") do
      assert_no_difference "Pokemon.count", "No new pokemons created" do
        post search_path, params: params
      end
    end

    assert_equal "Pokemon not found", flash[:error]
    assert_redirected_to root_path
  end

  test "search for an invalid pokemon with multiple names" do 
    params = {name: 'pika pika'}

    VCR.use_cassette("search_pika_pika") do
      assert_no_difference "Pokemon.count", "No new pokemons created" do
        post search_path, params: params
      end
    end

    assert_equal "Pokemon not found", flash[:error]
    assert_redirected_to root_path
  end
end
