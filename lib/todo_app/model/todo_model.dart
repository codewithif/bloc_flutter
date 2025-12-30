class TodoModel {
  final String id;
  final String title;
  final bool isCompleted;
  TodoModel({required this.id,required this.title,required this.isCompleted});
  TodoModel copyWith({
    String? title,bool? isCompleted,
}){
    return TodoModel(id: id, title: title??this.title, isCompleted: isCompleted??this.isCompleted);
}
}