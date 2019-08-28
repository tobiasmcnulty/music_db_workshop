defmodule MusicDB.Exercises.ChangesetExercises do
  import Ecto.Changeset
  alias MusicDB.{Repo, Artist, Track}

  def create_changeset_for_artist(artist) do
    # create a changeset for the given Artist struct - your changeset should set
    # the name to "Sarah Vaughan"
    # Artist.changeset(artist, %{name: "Sarah Vaughan"})
    change(artist, name: "Sarah Vaughan")
  end

  def create_changeset_from_map(params) do
    # create a changeset for an Artist struct using the given params, but ONLY allow
    # the name, and birth_date values
    # Artist.changeset(%Artist{}, Map.take(params, [:name, :birth_date]))
    cast(%Artist{}, params, [:name, :birth_date])
  end

  def changeset_for_track(track, params) do
    # create a changeset using the given %Track{} struct and params. Your changeset should
    # use cast() and do the following:
    #   - allow only the title and duration values
    #   - require title and duration values
    #   - require that the duration value be greater than 0
    Track.changeset(track, params)
  end

  def create_album_for_artist(artist, album_title) do
    # use Ecto.build_assoc to create an %Album{} struct with the given title, whose
    # parent record is the given artist
  end

  def create_child_records_with_put_assoc(artist, albums) do
    # Create a changeset for the given artist that uses put_assoc to set the given albums
    # as the child album records for the artist.
    #
    # Note that you will need to preload the album records for the artist struct before
    # attempting to call put_assoc
  end

  def create_child_records_with_cast_assoc(artist, albums) do
    # Create a changeset for the given artist that uses cast_assoc to set the given albums
    # as the child album records for the artist.
    #
    # Note that you will need to preload the album records for the artist struct before
    # attempting to call cast_assoc
  end
end
