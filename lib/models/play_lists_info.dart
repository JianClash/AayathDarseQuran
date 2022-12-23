// To parse this JSON data, do
//
//     final playListsInfo = playListsInfoFromJson(jsonString);

import 'dart:convert';

PlayListsInfo playListsInfoFromJson(String str) => PlayListsInfo.fromJson(json.decode(str));

String playListsInfoToJson(PlayListsInfo data) => json.encode(data.toJson());

class PlayListsInfo {
    PlayListsInfo({
        this.kind,
        this.etag,
        this.nextPageToken,
        this.pageInfo,
        this.items,
    });

    String? kind;
    String? etag;
    String? nextPageToken;
    PageInfo? pageInfo;
    List<Item>? items;

    factory PlayListsInfo.fromJson(Map<String, dynamic> json) => PlayListsInfo(
        kind: json["kind"],
        etag: json["etag"],
        nextPageToken: json["nextPageToken"],
        pageInfo: PageInfo.fromJson(json["pageInfo"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "nextPageToken": nextPageToken,
        "pageInfo": pageInfo!.toJson(),
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
    };
}

class Item {
    Item({
        this.kind,
        this.etag,
        this.id,
        this.contentDetails,
    });

    String? kind;
    String? etag;
    String? id;
    ContentDetails? contentDetails;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: json["kind"],
        etag: json["etag"],
        id: json["id"],
        contentDetails: ContentDetails.fromJson(json["contentDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "id": id,
        "contentDetails": contentDetails!.toJson(),
    };
}

class ContentDetails {
    ContentDetails({
        this.itemCount,
    });

    int? itemCount;

    factory ContentDetails.fromJson(Map<String, dynamic> json) => ContentDetails(
        itemCount: json["itemCount"],
    );

    Map<String, dynamic> toJson() => {
        "itemCount": itemCount,
    };
}

class PageInfo {
    PageInfo({
        this.totalResults,
        this.resultsPerPage,
    });

    int? totalResults;
    int? resultsPerPage;

    factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        totalResults: json["totalResults"],
        resultsPerPage: json["resultsPerPage"],
    );

    Map<String, dynamic> toJson() => {
        "totalResults": totalResults,
        "resultsPerPage": resultsPerPage,
    };
}

