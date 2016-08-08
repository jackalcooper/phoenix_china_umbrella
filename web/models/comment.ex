defmodule PhoenixChina.Comment do
  use PhoenixChina.Web, :model

  schema "comments" do
    field :content, :string
    field :praise_count, :integer, default: 0
    belongs_to :user, PhoenixChina.User
    belongs_to :post, PhoenixChina.Post

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:content])
    |> validate_required([:content])
    |> validate_length(:content, min: 1, max: 200)
  end
end
