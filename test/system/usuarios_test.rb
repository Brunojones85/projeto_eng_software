require "application_system_test_case"

class UsuariosTest < ApplicationSystemTestCase
   test "visiting the index" do
     visit "usuarios"
     assert_selector "h1", text: "Usuarios"
   end
end
