class Data {
  final String id;
  final String title;
  final String image;
  bool isShow = true;

  Data(
      {required this.id,
      required this.title,
      required this.image,
      this.isShow = true});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['imdbID'],
      title: json['Title'],
      image: json['Poster'],
    );
  }
}

// var data = [
//   Data(
//       id: DateTime.now().toString(),
//       title:
//           ' Those Magnificent Men in Their Flying Machines, or How I Flew from London to Paris in 25 Hours 11 Minutes',
//       image:
//           'https://m.media-amazon.com/images/M/MV5BYmMxZWRiMTgtZjM0Ny00NDQxLWIxYWQtZDdlNDNkOTEzYTdlXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg'),
//   Data(
//       id: DateTime.now().toString(),
//       title:
//           'Those Magnificent Men in Their Flying Machines, or How I Flew from London to Paris in 25 Hours 11 Minutes',
//       image:
//           'https://awsimages.detik.net.id/community/media/visual/2022/06/29/jadwal-film-xxi-di-denpasar-29-juni-2022-baru-tayang-minions-the-rise-of-gru.jpeg?w=650&q=80'),
// ];
