defmodule MusicDB.Track do
  use Ecto.Schema
  import Ecto.Changeset
  alias MusicDB.Album

  schema "tracks" do
    field(:title, :string)
    field(:duration, :integer)
    field(:duration_string, :string, virtual: true)
    field(:index, :integer)
    field(:number_of_plays, :integer)
    timestamps()

    belongs_to(:album, Album)
  end

  def changeset(track, params) do
    track
    |> cast(params, [:title, :duration])
    |> validate_required([:title])
    |> validate_required([:duration])
    |> validate_number(:duration, greater_than: 0)
  end
end
