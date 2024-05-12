// ignore_for_file: unused_field

class VideoItem {
  VideoItem.fromAPI(dynamic data) {
    _id = data['id'];
    _bvid = data['bvid'];
    _cid = data['cid'];
    //goto
    _uri = data['uri'];
    _pic = data['pic'];
    _title = data['title'];
    _duration = data['duration'];
    _pubdate = data['pubdate'];

    if (data['owner'] != null) {
      _ownerMid = data['owner']['mid'];
      _ownerName = data['owner']['name'];
      _ownerFace = data['owner']['face'];
    }

    if (data['stat'] != null) {
      _statView = data['stat']['view'];
      _statLike = data['stat']['like'];
      _statDanmaku = data['stat']['danmaku'];
    }
    //av_feature
    _isFollowed = data['is_followed'];

    if (data['rcmd_reason'] != null) {
      _rcmdReasonContent = data['rcmd_reason']['content'];
      _rcmdReasonReasontype = data['rcmd_reason']['type'];
    }
  }

  int? _id;

  //稿件bvid
  String? _bvid;

  int? _cid;

  //late String goto;

  String? _uri;

  //稿件封面
  String? _pic;
  //稿件标题
  String? _title;
  int? _duration;
  //稿件发布时间
  int? _pubdate;
  //up主信息
  //up mid
  int? _ownerMid;
  //up主昵称
  String? _ownerName;
  //up主头像
  String? _ownerFace;
  //稿件状态
  //观看量
  int? _statView;
  //获赞数
  int? _statLike;
  //弹幕数
  int? _statDanmaku;

  //late int statVt;

  //late String avFeature;

  //是否关注
  int? _isFollowed;
  //推荐
  //推荐理由
  String? _rcmdReasonContent;
  //推荐类型
  int? _rcmdReasonReasontype;

  //late int showInfo;
  //late String trackId;
  //late int pos;

  String? get title => _title;
  String? get ownerName => _ownerName;
  String? get pic => _pic;
}
