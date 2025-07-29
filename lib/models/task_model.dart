class CategoryModel {
  final String title;
  final String icon;
  final int color;

  CategoryModel({required this.title, required this.icon, required this.color});

  CategoryModel copyWith(String? title, String? icon, int? color) =>
      CategoryModel(
        title: title ?? this.title,
        icon: icon ?? this.icon,
        color: color ?? this.color,
      );

  Map<String, dynamic> toJson() => {
    'title': title,
    'icon': icon,
    'color': color,
  };

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    title: json['title'],
    icon: json['icon'],
    color: json['color'],
  );
}

class TaskModel {
  final int important;
  final String id;
  final CategoryModel categoryModel;
  final String description;
  final String title;
  final bool isDone;
  final bool isArxive;
  final bool isFavorite;
  final String attachmentUrls;
  final DateTime reminderTime;
  final DateTime createAt;
  final DateTime cancelledAd;
  final DateTime dueDate;
  final DateTime updatedAt;

  TaskModel({
    required this.important,
    required this.id,
    required this.categoryModel,
    required this.description,
    required this.title,
    required this.isDone,
    required this.isArxive,
    required this.isFavorite,
    required this.attachmentUrls,
    required this.reminderTime,
    required this.createAt,
    required this.cancelledAd,
    required this.dueDate,
    required this.updatedAt,
  });

  TaskModel copyWith(
    int? important,
    String? id,
    CategoryModel? categoryModel,
    String? description,
    String? title,
    bool? isDone,
    bool? isArxive,
    bool? isFavorite,
    String? attachmentUrls,
    DateTime? reminderTime,
    DateTime? createAt,
    DateTime? cancelledAd,
    DateTime? dueDate,
    DateTime? updatedAt,
  ) => TaskModel(
    important: important ?? this.important,
    id: id ?? this.id,
    categoryModel: categoryModel ?? this.categoryModel,
    description: description ?? this.description,
    title: title ?? this.title,
    isDone: isDone ?? this.isDone,
    isArxive: isArxive ?? this.isArxive,
    isFavorite: isFavorite ?? this.isFavorite,
    attachmentUrls: attachmentUrls ?? this.attachmentUrls,
    reminderTime: reminderTime ?? this.reminderTime,
    createAt: createAt ?? this.createAt,
    cancelledAd: cancelledAd ?? this.cancelledAd,
    dueDate: dueDate ?? this.dueDate,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Map<String, dynamic> toJson() => {
    'important': important,
    'id': id,
    'categoryModel': categoryModel,
    'description': description,
    'title': title,
    'isDone': isDone,
    'isArxive': isArxive,
    'isFavorite': isFavorite,
    'attachmentUrls': attachmentUrls,
    'reminderTime': reminderTime,
    'createAt': createAt,
    'cancelledAd': cancelledAd,
    'dueDate': dueDate,
    'updatedAt': updatedAt,
  };

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    important: json['important'],
    id: json['id'],
    categoryModel: json['categoryModel'],
    description: json['description'],
    title: json['title'],
    isDone: json['isDone'],
    isArxive: json['isArxive'],
    isFavorite: json['isFavorite'],
    attachmentUrls: json['attachmentUrls'],
    reminderTime: json['reminderTime'],
    createAt: json['createAt'],
    cancelledAd: json['cancelledAd'],
    dueDate: json['dueDate'],
    updatedAt: json['updatedAt'],
  );
}
