

// this file just to give us fake data until we get API
// booking detail screen

import 'package:focal_project/model/booking_details_model.dart';

class BookingDetailsService {
  BookingDetailsModel getBooking(int id) {
    return BookingDetailsModel(
      id: id,
      hotelName: 'The Aston Vill Hotel',
      hotelImage:
          'https://...',
      location: 'Veum Point, Michikoton',
      rating: 4.7,
      price: 120,
      checkIn: '12 Nov 2024',
      checkOut: '14 Nov 2024',
      guests: 2,
      rooms: 1,
      roomType: 'Queen Room',
      phone: '0214345646',
      barcode: '06158310-5427-471d-af1f-bd9029b',
      latitude: 40.7128,
      longitude: -74.0060,
    );
  }
}