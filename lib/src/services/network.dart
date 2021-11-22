import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mini_project/src/configs/api.dart';
import 'package:mini_project/src/pages/apartment/apartment_model.dart';
import 'package:mini_project/src/pages/condo/condo_model.dart';
import 'package:mini_project/src/pages/dormitory/dormitory_model.dart';
import 'package:mini_project/src/pages/mansion/mansion_model.dart';

class NetworkService {
  NetworkService._internal();

  static final NetworkService _instace = NetworkService._internal();

  factory NetworkService() => _instace;

  static final Dio _dio = Dio();


  // Future<UpcomingMovieModel> getUpcomingMovieDio() async {
  //   final response = await _dio.get(API.MOVIE_URL);
  //   if (response.statusCode == 200) {
  //     return upcomingMovieModelFromJson(json.encode(response.data));
  //   }
  //   throw Exception('Network failed');
  // }

  Future<CondoModel> getAllCondoDio() async {
    // var url = API.BASE_URL + '/flutterapi/getAllGames_7.php';
    var url = API.BASE_URL + API.CONDO;
    print('url getAllCondoDio() = ' + url);
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      print(response.data);
      return condoModelFromJson(json.encode(response.data));
    }
    throw Exception('Network failed');
  }

  Future<ApartmentModel> getAllApartmentDio() async {
    // var url = API.BASE_URL + '/flutterapi/getAllGames_7.php';
    var url = API.BASE_URL + API.APARTMENT;
    print('url getAllApartmentDio() = ' + url);
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      print(response.data);
      return apartmentModelFromJson(json.encode(response.data));
    }
    throw Exception('Network failed');
  }

  Future<DormitoryModel> getAllDormitoryDio() async {
    // var url = API.BASE_URL + '/flutterapi/getAllGames_7.php';
    var url = API.BASE_URL + API.DORMITORY;
    print('url getAllDormitoryDio() = ' + url);
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      print(response.data);
      return DormitoryModelFromJson(json.encode(response.data));
    }
    throw Exception('Network failed');
  }

  Future<MansionModel> getAllMansionDio() async {
    // var url = API.BASE_URL + '/flutterapi/getAllGames_7.php';
    var url = API.BASE_URL + API.MANSION;
    print('url getAllCondoDio() = ' + url);
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      print(response.data);
      return mansionModelFromJson(json.encode(response.data));
    }
    throw Exception('Network failed');
  }

  // Future<VideoModel> getVideoDio(String id) async {
  //   String vdoUrl = 'https://api.themoviedb.org/3/movie/';
  //   String key = '/videos?api_key=9235738f41167962e752864c6ad3ac46&language=en-US';
  //
  //   final response = await _dio.get(vdoUrl+id+key);
  //   if (response.statusCode == 200) {
  //     return videoModelFromJson(json.encode(response.data));
  //   }
  //   throw Exception('Network failed');
  // }

  Future<String> validateUserLoginDio(String username, String password) async {
    FormData data = FormData.fromMap({
      'username': username,
      'password': password,
    });
    try {
      //var url = API.BASE_URL + '/flutterapp/f_user_login.php';
      //var url = API.BASE_URL + '/api/user';
      var url = API.BASE_URL + '/flutterapi/api/user';
      print(url);
      final response = await _dio.post(url, data: data);
      if (response.statusCode == 200) {
        var jsonString = response.data;
        // var jsonMap = json.encode(jsonString);
        String username = jsonString["username"];
        print('username = ' + username);
        String password = jsonString["password"];
        print('password = ' + password);
        if (username != 'failed') {
          return 'pass';
        } else {
          return 'failed';
        }
      } else {
        return 'failed';
      }
    } catch (Exception) {
      throw Exception('Network failed');
    }
  }

  // Future<GameModel> getAllGameDio() async {
  //   //var url = API.BASE_URL + '/flutterapp/getAllGames_7.php';
  //   var url = API.BASE_URL + API.GAME_URL;
  //   print('url getAllGameDio() = ' + url);
  //   final response = await _dio.get(url);
  //   if (response.statusCode == 200) {
  //     print(response.data);
  //     return gameModelFromJson(json.encode(response.data));
  //   }
  //   throw Exception('Network failed');
  // }

  // Future<String> deleteGameDio(String id) async {
  //   print(API.BASE_URL + API.GAME_URL + '/' + id);
  //   final response = await _dio.delete(API.BASE_URL + API.GAME_URL + '/' + id);
  //
  //   if (response.statusCode == 200) {
  //     if (response.data > 0) {
  //       return 'Delete Successfully';
  //     } else {
  //       return 'Delete Failed';
  //     }
  //   }
  //   throw Exception('Network failed');
  // } //end

  Future<String> addCondoDio(File imageFile, Condo condo) async {
    FormData data = FormData.fromMap({
      'condo_id': condo.condoId,
      'condo_name': condo.condoName,
      'condo_price': condo.condoPrice,
      'condo_location': condo.condoLocation,
      'condo_phone': condo.condoPhone,
      'condo_limitedroom': condo.condoLimitedroom,
      'condo_facilities': condo.condoFacilities,
      'condo_type': condo.condoType,
      'condo_detail': condo.condoDetail,
      'condo_image' : condo.condoimage,

      if (imageFile != null)
        'condo_image': 'has_image'
      else
        'condo_image': 'no_image',
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        ),
    });
    try {
      final response = await _dio.post(API.BASE_URL + API.GAME_URL, data: data);
      print(response);
      if (response != null) {
        if (response.statusCode == 200) {
          print(response.data);
          if (response.data > 0) {
            return 'Add Successfully';
          } else {
            return 'Add Failed';
          }
        }
      } else {
        print('response is nulllllll');
      }
    } catch (DioError) {
      print('Exception --> response is nulllllll');
      print(DioError.toString());
      throw DioError();
    }
  }

  Future<String> editCondoDio(File imageFile, Condo condo) async {
    FormData data = FormData.fromMap({
      'condo_id': condo.condoId,
      'condo_name': condo.condoName,
      'condo_price': condo.condoPrice,
      'condo_location': condo.condoLocation,
      'condo_phone': condo.condoPhone,
      'condo_limitedroom': condo.condoLimitedroom,
      'condo_facilities': condo.condoFacilities,
      'condo_type': condo.condoType,
      'condo_detail': condo.condoDetail,
      'condo_image' : condo.condoimage,
      // if (imageFile != null)
      //   'photo': await MultipartFile.fromFile(
      //     imageFile.path,
      //     contentType: MediaType('image', 'jpg'),
      //   ),
      if (imageFile != null)
        'condo_image': condo.condoimage
      else
        'condo_image': 'no_image',
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        ),
    });

    // final response =
    // await _dio.post(API.BASE_URL + API.GAME_URL + '/' + game.id, data: data);
    // print(response.statusCode);
    // if (response.statusCode == 200) {
    //   print(response.data);
    //   if (response.data > 0) {
    //     return 'Edit Successfully';
    //   } else {
    //     return 'Edit Failed';
    //   }
    // }
    // throw Exception('Network failed');
  }
} // end class