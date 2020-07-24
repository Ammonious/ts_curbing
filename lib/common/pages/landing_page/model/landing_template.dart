class LandingTemplate {
	String mainValuePropTitle;
	String mainValuePropBody;
	List<String> sliderImages;

	LandingTemplate(
			{this.mainValuePropTitle, this.mainValuePropBody, this.sliderImages});

	LandingTemplate.fromJson(Map<dynamic, dynamic> json) {
		mainValuePropTitle = json['main_value_prop_title'] ?? '';
		mainValuePropBody = json['main_value_prop_body'] ?? '';
		 if(json['slider_images'] != null){
		 	sliderImages = List();
			 List images = json['slider_images'];
			 for(String image in images){
			 	sliderImages.add(image);
			 }
		 } else {
		 	sliderImages = List();
		 }
	}

	Map<dynamic, dynamic> toJson() {
		final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
		data['main_value_prop_title'] = this.mainValuePropTitle;
		data['main_value_prop_body'] = this.mainValuePropBody;
		data['slider_images'] = this.sliderImages;
		return data;
	}
}