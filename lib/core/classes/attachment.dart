class Attachment {
  Attachment({
    required this.id,
    required this.objectId,
    required this.objectTable,
    required this.path,
    required this.deleted,
    required this.createdAt,
    required this.createdBy,
  });

  int id;
  int objectId;
  String objectTable;
  String path;
  bool deleted;
  DateTime createdAt;
  int createdBy;

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
    id: json["id"],
    objectId: json["objectId"],
    objectTable: json["objectTable"],
    path: json["path"],
    deleted: json["deleted"],
    createdAt: DateTime.parse(json["createdAt"]),
    createdBy: json["createdBy"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "objectId": objectId,
    "objectTable": objectTable,
    "path": path,
    "deleted": deleted,
    "createdAt": createdAt.toIso8601String(),
    "createdBy": createdBy,
  };
}