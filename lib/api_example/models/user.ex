defmodule ApiExmaple.User do
    use Ecto.Schema
  
    schema "user" do
      field :first_name, :string
      field :last_name, :string
      field :age, :integer
    end
  end