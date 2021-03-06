class APIPath {
  static String users() => 'users/';
  static String userInfo(String uid) => 'users/$uid';
  static String hospitalInfo(String uid) => 'hospitals/$uid';

  static String profilePic(String uid) => 'profilePics/$uid';

  static String followerSpecific(String uid, String email) =>
      'followers/$uid/followers/$email';
  static String followers(String uid) => 'followers/$uid/followers/';

  static String followingSpecific(String uid, String email) =>
      'following/$uid/following/$email';

  static String following(String uid) => 'following/$uid/following';

  static String record(String recordId) => 'records/$recordId';
  static String records() => 'records/';

  static String postPicture(String postId) => 'posts/$postId';

  static String predictionApi(
          double carbs, double protein, double fats, String intensity) =>
      'https://pc-diet-prediction.herokuapp.com/predict?cho=${carbs.toString()}&protein=${protein.toString()}&fat=${fats.toString()}&intensity=$intensity';


  static String testpredictionApi(
          double carbs, double protein, double fats, String intensity) =>
      'https://pc-diet-prediction.herokuapp.com/predict?cho=350.12&protein=130.92&fat=83.1&intensity=moderate';
}
