class SongModel {
  String title;
  String singer;
  String imagePath;

  SongModel({
    required this.title,
    required this.singer,
    required this.imagePath
  });

  static List<SongModel> getSongs () {
    List<SongModel> songs = []; 

    songs.add(
      SongModel(
        title: 'Godzilla', 
        singer: 'Eminem', 
        imagePath: 'assets/img/godzilla.jpg'
      )
    );

    songs.add(
      SongModel(
        title: 'Dont stop me now', 
        singer: 'Queen', 
        imagePath: 'assets/img/dont.jpg'
      )
    );

    songs.add(
      SongModel(
        title: 'Sharks', 
        singer: 'Imagine Dragons', 
        imagePath: 'assets/img/AB1.jpeg'
      )
    );

    return songs;
  }
}