import 'dart:convert';
import 'dart:io';

import 'package:dhanda/helper/api_urls.dart';
import 'package:dhanda/helper/shared_prefs.dart';
import 'package:dhanda/model/business_model.dart';
import 'package:dhanda/model/return_model.dart';
import 'package:dhanda/model/review_tag_model.dart';
import 'package:dhanda/model/tag_model.dart';
import 'package:dio/dio.dart';

class HomeRepo {

  Future<BusinessModel> getBusinessList(params) async {
    String url = ApiUrls.businessesList;
    var dio = Dio();
    Response response = await dio.get(
        url,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: UserPreferences().getBearerToken(),
      }),
      queryParameters: params
    );
    BusinessModel businessModel = BusinessModel.fromJson(jsonDecode(response.toString()));
    print('API RESPONSE BUSINESS LIST : ${response.toString()}');
    return businessModel;
  }

  Future<BusinessModel> getMyList(params) async {
    print("My list params --- ${params}");
    String url = ApiUrls.myList;
    var dio = Dio();
    Response response = await dio.get(
        url,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: UserPreferences().getBearerToken(),
      }),
      queryParameters: params
    );
    BusinessModel businessModel = BusinessModel.fromJson(jsonDecode(response.toString()));
    print('API RESPONSE MY LIST : ${response.toString()}');
    return businessModel;
  }

  Future<TagModel> getTags() async {
    var dio = Dio();
    Response response = await dio.get(
      ApiUrls.tags,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: UserPreferences().getBearerToken(),
      }),
    );
    TagModel tagModel = TagModel.fromJson(jsonDecode(response.toString()));
    print('API RESPONSE TAGS : ${response.toString()}');
    return tagModel;
  }

  Future<ReviewTagModel> getReviewTags() async {
    var dio = Dio();
    Response response = await dio.get(
      ApiUrls.getReviews,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: UserPreferences().getBearerToken(),
      }),
    );
    ReviewTagModel tagModel = ReviewTagModel.fromJson(jsonDecode(response.toString()));
    print('API RESPONSE REVIEW TAG : ${response.toString()}');
    return tagModel;
  }

  Future<ReviewTagModel> postBusinessReview(params) async {
    var dio = Dio();
    Response response = await dio.post(
      ApiUrls.businessReview,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: UserPreferences().getBearerToken(),
      }),
      data: params
    );
    ReviewTagModel tagModel = ReviewTagModel.fromJson(jsonDecode(response.toString()));
    print('API RESPONSE POST REVIEW : ${response.toString()}');
    return tagModel;
  }

  Future<ReviewTagModel> postCall(params) async {
    var dio = Dio();
    Response response = await dio.post(
      ApiUrls.BASE_URL+"/business/"+params+"/call_count",
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: UserPreferences().getBearerToken(),
      }),
    );
    ReviewTagModel tagModel = ReviewTagModel.fromJson(jsonDecode(response.toString()));
    print('API RESPONSE POST CALL : ${response.toString()}');
    return tagModel;
  }

  Future<ReviewTagModel> postShare(params) async {
    var dio = Dio();
    Response response = await dio.post(
      ApiUrls.BASE_URL+"/business/"+params+"/share_count",
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: UserPreferences().getBearerToken(),
      }),
    );
    ReviewTagModel tagModel = ReviewTagModel.fromJson(jsonDecode(response.toString()));
    print('API RESPONSE POST SHARE : ${response.toString()}');
    return tagModel;
  }

  Future<ReturnModel> addRemoveCard(params,id) async {
    var dio = Dio();
    Response response = await dio.post(
      ApiUrls.BASE_URL+"/business/${id}/add_to_my_list",
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader: UserPreferences().getBearerToken(),
      }),
      data: params
    );
    ReturnModel returnModel = ReturnModel.fromJson(jsonDecode(response.toString()));
    print('API RESPONSE ADD REMOVE : ${response.toString()}');
    return returnModel;
  }

  Future<ReturnModel> updateName(params) async {
    var dio = Dio();
    Response response = await dio.post(
      ApiUrls.updateName,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader: UserPreferences().getBearerToken(),
      }),
      data: params
    );
    ReturnModel returnModel = ReturnModel.fromJson(jsonDecode(response.toString()));
    print('API RESPONSE UPDATE NAME : ${response.toString()}');
    return returnModel;
  }

}
