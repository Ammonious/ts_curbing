class ProductService {
	String landingTitle;
	String landingBody;
	String landingImageUrl;
	int index;

	ProductService({this.landingTitle, this.landingBody, this.landingImageUrl,this.index});

	ProductService.landingEmpty(){
		landingTitle = '';
		landingBody =  '';
		landingImageUrl ='';
		index = 0;
	}
	ProductService.fromJson(Map<dynamic, dynamic> json) {
		landingTitle = json['landing_title'] ?? '';
		landingBody = json['landing_body'] ?? '';
		landingImageUrl = json['landing_image_url'] ?? '';
		index = json['index'] ?? 0;
	}

	Map<dynamic, dynamic> toJson() {
		final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
		data['landing_title'] = this.landingTitle;
		data['landing_body'] = this.landingBody;
		data['landing_image_url'] = this.landingImageUrl;
		data['index'] = this.index;
		return data;
	}

	get landingIsEmpty => landingBody == '' && landingTitle == '' && landingImageUrl == '';
}