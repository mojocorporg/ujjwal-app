import 'package:dhanda/helper/config.dart';
import 'package:dhanda/model/business_model.dart';
import 'package:dhanda/repository/home_repo.dart';
import 'package:dhanda/model/review_tag_model.dart' as reviewModel;
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:social_share/social_share.dart';

class BusinessDetailController extends GetxController{

  ScreenshotController screenshotController = new ScreenshotController();
  Data cardData;
  reviewModel.ReviewTagModel reviewTagModel;

  var reviewList = List<reviewModel.Data>().obs;

  var allReviewList = List<reviewModel.Data>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void shareCard()async{
    String dir = (await getApplicationDocumentsDirectory()).path;
    screenshotController.capture(path: dir+"/shareImage.png",pixelRatio: 5).then((value){
      SocialShare.shareOptions("",imagePath: value.path);
    });
  }


  void selectReviewTag(reviewModel.Data reviews){
    for(int i=0;i<reviewList.length;i++){
        if(reviewList[i] == reviews){
          if(reviewList[i].isSelected == 1){
            reviewList[i].isSelected = 0;
          }else{
            reviewList[i].isSelected = 1;
          }

          postBusinessReview();
        }
    }
  }

  void postBusinessReview(){
    List<int> selectedReviewList = [];
    for(int i=0;i<reviewList.length;i++){
      if(reviewList[i].isSelected == 1){
        selectedReviewList.add(reviewList[i].id);
      }
    }

    Map<String,dynamic> params = {
      "business_id" : cardData.id,
      "reviews" : selectedReviewList
    };
    HomeRepo().postBusinessReview(params).then((value){

    });
  }


  void getReviewTags() {
    HomeRepo().getReviewTags().then((value) {
      if (value != null && value.data != null && value.data.length > 0) {
        reviewTagModel = value;
        allReviewList.addAll(reviewTagModel.data);

        for(int i=0;i<reviewTagModel.data.length;i++){
          for(int j=0;j<cardData.reviews.length;j++){
            if(allReviewList[i].name == cardData.reviews[j].name){
              allReviewList[i].isSelected = 1;
            }
          }
        }

        reviewList.assignAll(allReviewList);
      } else {

      }
    });
  }

  void addRemoveCard(String status){
    Map<String,String> params = {
      "status" :status,
    };
    HomeRepo().addRemoveCard(params,cardData.id.toString()).then((value) {

      if(value.status){
        Config().displaySnackBar(value.message, "");
      }else{
        Config().displaySnackBar(value.message, "");
      }

    });
  }

}