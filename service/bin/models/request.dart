class RPCRequest {
  String id;
  String type;
  Map<String, dynamic> params;

  RPCRequest({this.id, this.type, this.params});

  RPCRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    params = json['params'].cast<String, dynamic>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['params'] = data;

    return data;
  }
}

class SearchRequestParams {
  String query;

  SearchRequestParams({this.query});

  SearchRequestParams.fromJson(Map<String, dynamic> json) {
    query = json['query'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['query'] = query;

    return data;
  }
}
