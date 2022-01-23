class FullBodyWorkoutModel {
  final String workoutName;
  final String workoutReps;
  final String workoutImage;
  final bool isWorking;
  final bool isCompleted;

  FullBodyWorkoutModel(this.workoutName, this.workoutReps, this.workoutImage,
      this.isWorking, this.isCompleted);
  static List<FullBodyWorkoutModel> fullbodyWorkoutListItems() {
    List<FullBodyWorkoutModel> fullbodyworkoutList =
        List<FullBodyWorkoutModel>();
    fullbodyworkoutList.add(FullBodyWorkoutModel(
        "JUMPING JACKS",
        "00:20",
        "https://fitpass-images.s3.amazonaws.com/content_blog_inner_E4B1CDF6.gif",
        false,
        true));
    fullbodyworkoutList.add(FullBodyWorkoutModel(
        "INCLINED PUSH-UPS",
        "x12",
        "https://fitpass-images.s3.amazonaws.com/content_blog_inner_E4B1CDF6.gif",
        true,
        false));
    /*fullbodyworkoutList.add(FullBodyWorkoutModel("PUSHUPS", "x12",
        "https://fitpass-images.s3.amazonaws.com/content_blog_inner_E4B1CDF6.gif",false));*/
    fullbodyworkoutList.add(FullBodyWorkoutModel(
        "RUSSIAN TWIST",
        "x12",
        "https://fitpass-images.s3.amazonaws.com/content_blog_inner_E4B1CDF6.gif",
        false,
        false));
    /*fullbodyworkoutList.add(FullBodyWorkoutModel("PLIE SQUATS", "x12",
        "https://fitpass-images.s3.amazonaws.com/content_blog_inner_E4B1CDF6.gif",false));*/
    fullbodyworkoutList.add(FullBodyWorkoutModel(
        "OFFSET PUSH-UPS",
        "x12",
        "https://fitpass-images.s3.amazonaws.com/content_blog_inner_E4B1CDF6.gif",
        false,
        false));
    fullbodyworkoutList.add(FullBodyWorkoutModel(
        "BACKWARD LUNGE",
        "x12",
        "https://fitpass-images.s3.amazonaws.com/content_blog_inner_E4B1CDF6.gif",
        false,
        false));
    fullbodyworkoutList.add(FullBodyWorkoutModel(
        "DIAMOND PUSH-UPS",
        "x12",
        "https://i.pinimg.com/originals/0d/68/85/0d68851b7d5f838aaa16a987bd9dd58c.gif",
        false,
        false));
    fullbodyworkoutList.add(FullBodyWorkoutModel(
        "PUSH UP HOLD", "00:10", "https://i.gifer.com/756z.gif", false, false));
    fullbodyworkoutList.add(FullBodyWorkoutModel(
        "COBRA STRETCH",
        "00:20",
        "https://177d01fbswx3jjl1t20gdr8j-wpengine.netdna-ssl.com/wp-content/uploads/2019/06/Childs-Pose-to-Cobra.gif",
        false,
        false));
    fullbodyworkoutList.add(FullBodyWorkoutModel(
        "CHEST STRENGTH",
        "00:20",
        "https://bobbyberk.com/wp-content/uploads/2020/01/forward-fold-chest-opener.gif",
        false,
        false));
    return fullbodyworkoutList;
  }
}
