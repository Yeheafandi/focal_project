class BookingDetailsModel {
  final int id;

  final String hotelName;
  final String hotelImage;
  final String location;
  final double rating;
  final double price;

  final String checkIn;
  final String checkOut;

  final int guests;
  final int rooms;

  final String roomType;
  final String phone;

  final String barcode;

  final double latitude;
  final double longitude;

  BookingDetailsModel({
    required this.id,
    required this.hotelName,
    required this.hotelImage,
    required this.location,
    required this.rating,
    required this.price,
    required this.checkIn,
    required this.checkOut,
    required this.guests,
    required this.rooms,
    required this.roomType,
    required this.phone,
    required this.barcode,
    required this.latitude,
    required this.longitude,
  });

  factory BookingDetailsModel.fromJson(Map<String, dynamic> json) {
    return BookingDetailsModel(
      id: json['id'],
      hotelName: json['hotelName'],
      hotelImage: json['hotelImage'],
      location: json['location'],
      rating: (json['rating'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      checkIn: json['checkIn'],
      checkOut: json['checkOut'],
      guests: json['guests'],
      rooms: json['rooms'],
      roomType: json['roomType'],
      phone: json['phone'],
      barcode: json['barcode'],
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );
  }

 
}