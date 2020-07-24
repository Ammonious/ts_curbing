import 'package:flutter/material.dart';

class MenuItem {
	String title;
	String subtitle;
	Widget icon;

	MenuItem({this.title, this.subtitle,this.icon});

	MenuItem.fromJson(Map<dynamic, dynamic> json) {
		title = json['title'] ?? '';
		subtitle = json['subtitle'] ?? '';
		icon = json['icon'];
	}

	Map<dynamic, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['title'] = this.title;
		data['subtitle'] = this.subtitle;
		return data;
	}
}