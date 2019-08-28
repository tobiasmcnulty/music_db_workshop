defmodule MusicDB.Exercises.AssociationExercises do
  import Ecto.Query
  alias MusicDB.{Repo, Album, Release}

  def insert_album_and_release do
    # insert an album with the title "Giant Steps" along with an associated release with the
    # title "Giant Steps (remastered)"
    a = Repo.insert!(%Album{title: "Giant Steps"})
    Repo.insert!(%Release{title: "Giant Steps (remastered)", album: a})
  end

  def fetch_album_with_releases do
    # load the album with the title "Giant Steps" and make sure the releases are preloaded
    # Alternative implementation:
    # Repo.get_by(Album, title: "Giant Steps") |> Repo.preload(:releases)
    q =
      from(a in Album,
        where: a.title == "Giant Steps",
        preload: [:releases]
      )

    # Repo.one will raise an error if more than 1 result
    Repo.one(q)
  end

  def delete_album_and_release(album) do
    # delete the given album - make sure the association is setup so that the associated release
    # is deleted as well
    Repo.delete!(album)
  end
end
