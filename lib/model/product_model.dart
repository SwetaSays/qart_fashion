class QartProduct {
  QartProduct({
    required this.productCount,
    required this.products,
    required this.brands,
    required this.lastUpdatedToken,
    required this.appColor,
  });

  final int? productCount;
  final List<Product> products;
  final List<Brand> brands;
  final int? lastUpdatedToken;
  final dynamic appColor;

  factory QartProduct.fromJson(Map<String, dynamic> json){
    return QartProduct(
      productCount: json["ProductCount"],
      products: json["Products"] == null ? [] : List<Product>.from(json["Products"]!.map((x) => Product.fromJson(x))),
      brands: json["Brands"] == null ? [] : List<Brand>.from(json["Brands"]!.map((x) => Brand.fromJson(x))),
      lastUpdatedToken: json["LastUpdatedToken"],
      appColor: json["AppColor"],
    );
  }

  Map<String, dynamic> toJson() => {
    "ProductCount": productCount,
    "Products": products.map((x) => x.toJson()).toList(),
    "Brands": brands.map((x) => x.toJson()).toList(),
    "LastUpdatedToken": lastUpdatedToken,
    "AppColor": appColor,
  };

}

class Brand {
  Brand({
    required this.name,
    required this.moq,
  });

  final String? name;
  final int? moq;

  factory Brand.fromJson(Map<String, dynamic> json){
    return Brand(
      name: json["Name"],
      moq: json["MOQ"],
    );
  }

  Map<String, dynamic> toJson() => {
    "Name": name,
    "MOQ": moq,
  };

}

class Product {
  Product({
    required this.season,
    required this.brand,
    required this.mood,
    required this.gender,
    required this.theme,
    required this.category,
    required this.name,
    required this.color,
    required this.option,
    required this.mrp,
    required this.subCategory,
    required this.collection,
    required this.fit,
    required this.description,
    required this.qrCode,
    required this.looks,
    required this.looksImageUrl,
    required this.looksImage,
    required this.fabric,
    required this.ean,
    required this.finish,
    required this.availableSizes,
    required this.availableSizesWithDeactivated,
    required this.sizeWiseStock,
    required this.sizeWiseStockPlant,
    required this.offerMonths,
    required this.productClass,
    required this.promoted,
    required this.secondary,
    required this.deactivated,
    required this.defaultSize,
    required this.material,
    required this.quality,
    required this.qrCode2,
    required this.displayName,
    required this.displayOrder,
    required this.minQuantity,
    required this.maxQuantity,
    required this.qpsCode,
    required this.demandType,
    required this.image,
    required this.imageUrl,
    required this.imageUrl2,
    required this.imageUrl3,
    required this.imageUrl4,
    required this.imageUrl5,
    required this.imageUrl6,
    required this.imageUrl7,
    required this.imageUrl8,
    required this.imageUrl9,
    required this.imageUrl10,
    required this.imageUrl11,
    required this.imageUrl12,
    required this.adShoot,
    required this.technology,
    required this.imageAlt,
    required this.technologyImage,
    required this.technologyImageUrl,
    required this.isCore,
    required this.minimumArticleQuantity,
    required this.likeabilty,
    required this.brandRank,
    required this.gradeToRatiosApps,
    required this.relatedProducts,
  });

  final String? season;
  final String? brand;
  final String? mood;
  final String? gender;
  final String? theme;
  final String? category;
  final String? name;
  final String? color;
  final String? option;
  final int? mrp;
  final String? subCategory;
  final String? collection;
  final String? fit;
  final String? description;
  final String? qrCode;
  final String? looks;
  final dynamic looksImageUrl;
  final dynamic looksImage;
  final String? fabric;
  final Ean? ean;
  final String? finish;
  final List<String> availableSizes;
  final List<AvailableSizesWithDeactivated> availableSizesWithDeactivated;
  final SizeWiseStock? sizeWiseStock;
  final SizeWiseStock? sizeWiseStockPlant;
  final List<String> offerMonths;
  final int? productClass;
  final bool? promoted;
  final bool? secondary;
  final bool? deactivated;
  final dynamic defaultSize;
  final String? material;
  final String? quality;
  final String? qrCode2;
  final String? displayName;
  final int? displayOrder;
  final int? minQuantity;
  final int? maxQuantity;
  final String? qpsCode;
  final dynamic demandType;
  final String? image;
  final String? imageUrl;
  final String? imageUrl2;
  final String? imageUrl3;
  final String? imageUrl4;
  final String? imageUrl5;
  final dynamic imageUrl6;
  final dynamic imageUrl7;
  final dynamic imageUrl8;
  final dynamic imageUrl9;
  final dynamic imageUrl10;
  final dynamic imageUrl11;
  final dynamic imageUrl12;
  final bool? adShoot;
  final String? technology;
  final String? imageAlt;
  final dynamic technologyImage;
  final String? technologyImageUrl;
  final bool? isCore;
  final int? minimumArticleQuantity;
  final int? likeabilty;
  final String? brandRank;
  final List<dynamic> gradeToRatiosApps;
  final List<dynamic> relatedProducts;

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      season: json["Season"],
      brand: json["Brand"],
      mood: json["Mood"],
      gender: json["Gender"],
      theme: json["Theme"],
      category: json["Category"],
      name: json["Name"],
      color: json["Color"],
      option: json["Option"],
      mrp: json["MRP"],
      subCategory: json["SubCategory"],
      collection: json["Collection"],
      fit: json["Fit"],
      description: json["Description"],
      qrCode: json["QRCode"],
      looks: json["Looks"],
      looksImageUrl: json["LooksImageUrl"],
      looksImage: json["LooksImage"],
      fabric: json["Fabric"],
      ean: json["EAN"] == null ? null : Ean.fromJson(json["EAN"]),
      finish: json["Finish"],
      availableSizes: json["AvailableSizes"] == null ? [] : List<String>.from(json["AvailableSizes"]!.map((x) => x)),
      availableSizesWithDeactivated: json["AvailableSizesWithDeactivated"] == null ? [] : List<AvailableSizesWithDeactivated>.from(json["AvailableSizesWithDeactivated"]!.map((x) => AvailableSizesWithDeactivated.fromJson(x))),
      sizeWiseStock: json["SizeWiseStock"] == null ? null : SizeWiseStock.fromJson(json["SizeWiseStock"]),
      sizeWiseStockPlant: json["SizeWiseStockPlant"] == null ? null : SizeWiseStock.fromJson(json["SizeWiseStockPlant"]),
      offerMonths: json["OfferMonths"] == null ? [] : List<String>.from(json["OfferMonths"]!.map((x) => x)),
      productClass: json["ProductClass"],
      promoted: json["Promoted"],
      secondary: json["Secondary"],
      deactivated: json["Deactivated"],
      defaultSize: json["DefaultSize"],
      material: json["Material"],
      quality: json["Quality"],
      qrCode2: json["QRCode2"],
      displayName: json["DisplayName"],
      displayOrder: json["DisplayOrder"],
      minQuantity: json["MinQuantity"],
      maxQuantity: json["MaxQuantity"],
      qpsCode: json["QPSCode"],
      demandType: json["DemandType"],
      image: json["Image"],
      imageUrl: json["ImageUrl"],
      imageUrl2: json["ImageUrl2"],
      imageUrl3: json["ImageUrl3"],
      imageUrl4: json["ImageUrl4"],
      imageUrl5: json["ImageUrl5"],
      imageUrl6: json["ImageUrl6"],
      imageUrl7: json["ImageUrl7"],
      imageUrl8: json["ImageUrl8"],
      imageUrl9: json["ImageUrl9"],
      imageUrl10: json["ImageUrl10"],
      imageUrl11: json["ImageUrl11"],
      imageUrl12: json["ImageUrl12"],
      adShoot: json["AdShoot"],
      technology: json["Technology"],
      imageAlt: json["ImageAlt"],
      technologyImage: json["TechnologyImage"],
      technologyImageUrl: json["TechnologyImageUrl"],
      isCore: json["IsCore"],
      minimumArticleQuantity: json["MinimumArticleQuantity"],
      likeabilty: json["Likeabilty"],
      brandRank: json["BrandRank"],
      gradeToRatiosApps: json["GradeToRatiosApps"] == null ? [] : List<dynamic>.from(json["GradeToRatiosApps"]!.map((x) => x)),
      relatedProducts: json["RelatedProducts"] == null ? [] : List<dynamic>.from(json["RelatedProducts"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "Season": season,
    "Brand": brand,
    "Mood": mood,
    "Gender": gender,
    "Theme": theme,
    "Category": category,
    "Name": name,
    "Color": color,
    "Option": option,
    "MRP": mrp,
    "SubCategory": subCategory,
    "Collection": collection,
    "Fit": fit,
    "Description": description,
    "QRCode": qrCode,
    "Looks": looks,
    "LooksImageUrl": looksImageUrl,
    "LooksImage": looksImage,
    "Fabric": fabric,
    "EAN": ean?.toJson(),
    "Finish": finish,
    "AvailableSizes": availableSizes.map((x) => x).toList(),
    "AvailableSizesWithDeactivated": availableSizesWithDeactivated.map((x) => x.toJson()).toList(),
    "SizeWiseStock": sizeWiseStock?.toJson(),
    "SizeWiseStockPlant": sizeWiseStockPlant?.toJson(),
    "OfferMonths": offerMonths.map((x) => x).toList(),
    "ProductClass": productClass,
    "Promoted": promoted,
    "Secondary": secondary,
    "Deactivated": deactivated,
    "DefaultSize": defaultSize,
    "Material": material,
    "Quality": quality,
    "QRCode2": qrCode2,
    "DisplayName": displayName,
    "DisplayOrder": displayOrder,
    "MinQuantity": minQuantity,
    "MaxQuantity": maxQuantity,
    "QPSCode": qpsCode,
    "DemandType": demandType,
    "Image": image,
    "ImageUrl": imageUrl,
    "ImageUrl2": imageUrl2,
    "ImageUrl3": imageUrl3,
    "ImageUrl4": imageUrl4,
    "ImageUrl5": imageUrl5,
    "ImageUrl6": imageUrl6,
    "ImageUrl7": imageUrl7,
    "ImageUrl8": imageUrl8,
    "ImageUrl9": imageUrl9,
    "ImageUrl10": imageUrl10,
    "ImageUrl11": imageUrl11,
    "ImageUrl12": imageUrl12,
    "AdShoot": adShoot,
    "Technology": technology,
    "ImageAlt": imageAlt,
    "TechnologyImage": technologyImage,
    "TechnologyImageUrl": technologyImageUrl,
    "IsCore": isCore,
    "MinimumArticleQuantity": minimumArticleQuantity,
    "Likeabilty": likeabilty,
    "BrandRank": brandRank,
    "GradeToRatiosApps": gradeToRatiosApps.map((x) => x).toList(),
    "RelatedProducts": relatedProducts.map((x) => x).toList(),
  };

}

class AvailableSizesWithDeactivated {
  AvailableSizesWithDeactivated({
    required this.size,
    required this.isDeactevated,
  });

  final String? size;
  final bool? isDeactevated;

  factory AvailableSizesWithDeactivated.fromJson(Map<String, dynamic> json){
    return AvailableSizesWithDeactivated(
      size: json["Size"],
      isDeactevated: json["IsDeactevated"],
    );
  }

  Map<String, dynamic> toJson() => {
    "Size": size,
    "IsDeactevated": isDeactevated,
  };

}

class Ean {
  Ean({
    required this.the28,
    required this.the30,
    required this.the32,
    required this.the34,
    required this.the36,
    required this.the38,
    required this.the40,
    required this.l,
    required this.m,
    required this.s,
    required this.xl,
    required this.xxl,
    required this.xxxl,
    required this.the42,
    required this.xs,
  });

  final String? the28;
  final String? the30;
  final String? the32;
  final String? the34;
  final String? the36;
  final String? the38;
  final String? the40;
  final String? l;
  final String? m;
  final String? s;
  final String? xl;
  final String? xxl;
  final String? xxxl;
  final String? the42;
  final String? xs;

  factory Ean.fromJson(Map<String, dynamic> json){
    return Ean(
      the28: json["28"],
      the30: json["30"],
      the32: json["32"],
      the34: json["34"],
      the36: json["36"],
      the38: json["38"],
      the40: json["40"],
      l: json["L"],
      m: json["M"],
      s: json["S"],
      xl: json["XL"],
      xxl: json["XXL"],
      xxxl: json["XXXL"],
      the42: json["42"],
      xs: json["XS"],
    );
  }

  Map<String, dynamic> toJson() => {
    "28": the28,
    "30": the30,
    "32": the32,
    "34": the34,
    "36": the36,
    "38": the38,
    "40": the40,
    "L": l,
    "M": m,
    "S": s,
    "XL": xl,
    "XXL": xxl,
    "XXXL": xxxl,
    "42": the42,
    "XS": xs,
  };

}

class SizeWiseStock {
  SizeWiseStock({required this.json});
  final Map<String,dynamic> json;

  factory SizeWiseStock.fromJson(Map<String, dynamic> json){
    return SizeWiseStock(
        json: json
    );
  }

  Map<String, dynamic> toJson() => {
  };

}
