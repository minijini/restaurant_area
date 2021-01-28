class Restaurant {
  JNRestaurant jnrestaurant;

  Restaurant({this.jnrestaurant});

  Restaurant.fromJson(Map<String, dynamic> json) {
    jnrestaurant = json['JNRestaurant'] != null
        ? new JNRestaurant.fromJson(json['JNRestaurant'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jnrestaurant != null) {
      data['JNRestaurant'] = this.jnrestaurant.toJson();
    }
    return data;
  }
}

class JNRestaurant {
  int listtotalcount;
  RESULT result;
  List<Row1> row;

  JNRestaurant({this.listtotalcount, this.result, this.row});

  JNRestaurant.fromJson(Map<String, dynamic> json) {
    listtotalcount = json['list_total_count'];
    result =
        json['RESULT'] != null ? new RESULT.fromJson(json['RESULT']) : null;
    if (json['row'] != null) {
      row = new List<Row1>();
      json['row'].forEach((v) {
        row.add(new Row1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['list_total_count'] = this.listtotalcount;
    if (this.result != null) {
      data['RESULT'] = this.result.toJson();
    }
    if (this.row != null) {
      data['row'] = this.row.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RESULT {
  String code;
  String message;

  RESULT({this.code, this.message});

  RESULT.fromJson(Map<String, dynamic> json) {
    code = json['CODE'];
    message = json['MESSAGE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CODE'] = this.code;
    data['MESSAGE'] = this.message;
    return data;
  }
}

class Row1 {
  String cggcode; //시군구코드
  String asgnyy; //지정년도
  String asgnsno; //지정번호
  String applymd; //신청일자
  String asgnymd; //지정일자
  String upsonm; //업소명
  String siteaddrrd; //소재지도로명
  String siteaddr; //소재지지번
  String permntno; //허가(신고)번호
  String sntuptaenm; //업태명
  String mainedf; //주된음식
  double trdparea; //영업장면적
  String admdngnm; //행정동명
  String gradefacilgbn; //급수시설구분
  String upsositetelno; //소재지전화번호
  num lat;
  num lng;

  Row1(
      {this.cggcode,
      this.asgnyy,
      this.asgnsno,
      this.applymd,
      this.asgnymd,
      this.upsonm,
      this.siteaddrrd,
      this.siteaddr,
      this.permntno,
      this.sntuptaenm,
      this.mainedf,
      this.trdparea,
      this.admdngnm,
      this.gradefacilgbn,
      this.upsositetelno});

  Row1.fromJson(Map<String, dynamic> json) {
    cggcode = json['CGG_CODE'];
    asgnyy = json['ASGN_YY'];
    asgnsno = json['ASGN_SNO'];
    applymd = json['APPL_YMD'];
    asgnymd = json['ASGN_YMD'];
    upsonm = json['UPSO_NM'];
    siteaddrrd = json['SITE_ADDR_RD'];
    siteaddr = json['SITE_ADDR'];
    permntno = json['PERM_NT_NO'];
    sntuptaenm = json['SNT_UPTAE_NM'];
    mainedf = json['MAIN_EDF'];
    trdparea = json['TRDP_AREA'];
    admdngnm = json['ADMDNG_NM'];
    gradefacilgbn = json['GRADE_FACIL_GBN'];
    upsositetelno = json['UPSO_SITE_TELNO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CGG_CODE'] = this.cggcode;
    data['ASGN_YY'] = this.asgnyy;
    data['ASGN_SNO'] = this.asgnsno;
    data['APPL_YMD'] = this.applymd;
    data['ASGN_YMD'] = this.asgnymd;
    data['UPSO_NM'] = this.upsonm;
    data['SITE_ADDR_RD'] = this.siteaddrrd;
    data['SITE_ADDR'] = this.siteaddr;
    data['PERM_NT_NO'] = this.permntno;
    data['SNT_UPTAE_NM'] = this.sntuptaenm;
    data['MAIN_EDF'] = this.mainedf;
    data['TRDP_AREA'] = this.trdparea;
    data['ADMDNG_NM'] = this.admdngnm;
    data['GRADE_FACIL_GBN'] = this.gradefacilgbn;
    data['UPSO_SITE_TELNO'] = this.upsositetelno;
    return data;
  }
}
