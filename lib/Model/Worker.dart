import 'package:freelance_worker/Model/UserDetails.dart';

import 'Address.dart';

class Worker extends UserDetails{
  List<Work> work;
  String rating;
  UserAddress address;
  List<Review> reviews;

  Worker({this.address,this.rating,this.reviews,this.work});

  Map<String,dynamic> toMap(){
    return {
      'work':Work.ConvertCustomStepsToMap(work),
      'rating':rating,
      'address':address.toMap(),
      'reviews':Review.ConvertCustomStepsToMap(reviews)
    };
  }

  Worker.fromFirestore(Map<String,dynamic> firestore):
        work=(firestore['work'] as List).map((e) => Work.fromFirestore(e.cast<String,dynamic>())).toList(),
        rating=firestore['rating'],
        address=UserAddress.fromFirestore(firestore['address']),
        reviews=(firestore['reviews'] as List).map((e) => Review.fromFirestore(e.cast<String,dynamic>())).toList();
}

class Work {
  String workName;
  String experience;

  Work({this.workName, this.experience});

  Map<String,dynamic> toMap(){
    return {
      'workName':workName,
      'experience':experience
    };
  }

  Work.fromFirestore(Map<String,dynamic> firestore):
      workName=firestore['workName'],
      experience=firestore['experience'];

  static List<Map> ConvertCustomStepsToMap(List<Work> customSteps) {
    List<Map> steps = [];
    customSteps.forEach((Work customStep) {
      Map step = customStep.toMap();
      steps.add(step);
    });
    return steps;
  }
}

class Review{
  String review;
  String rating;

  Review({this.review, this.rating});

  Map<String,dynamic> toMap(){
    return {
      'review':review,
      'rating':rating
    };
  }

  Review.fromFirestore(Map<String,dynamic> firestore):
        review=firestore['review'],
        rating=firestore['rating'];

  static List<Map> ConvertCustomStepsToMap(List<Review> customSteps) {
    List<Map> steps = [];
    customSteps.forEach((Review customStep) {
      Map step = customStep.toMap();
      steps.add(step);
    });
    return steps;
  }
}