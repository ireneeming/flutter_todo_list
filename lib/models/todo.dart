class Todo {
  late int? id;
  late String title;
  late String description;

  Todo({this.id, required this.title, required this.description});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  Todo.fromMap(Map<dynamic, dynamic>? map) {
    id = map?['id'];
    title = map?['title'];
    description = map?['description'];
  }
}

// toMap() fromMap() 함수 ===> Todo 데이터를 외부로 보내기 위해 양식을 맞추거나 (toMap) 네트워크 호출 등을 통해 
// 받아오는 데이터를 Todo 데이터를 외부로 보내기 위해서 양식을 맞추거나
// toMap() 네트워크 호출 등을 통해 받아오는 데이터를 Todo 모델로 변환하는 기능을 수행한다.
// fromMap()은 일반적으로 네트워크를 통해 주고받는 데이터의 양식은 Json. 플러터에서 Map<String, dynamic> 형태로 표현
// 데이터를 외부로부터 받을 때에도 처음엔 Map 형태로 들어올 것이고, 밖으로 보낼 때에도 Map 형태로 보내야 하기 때문에 이런 기능을 작성해야함.
// 네트워크 뿐만 아니라 sqlite와 같은 데이터베이스와 통신할 때에도 같은 방식으로 진행된다.
