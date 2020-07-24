import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/models/persistent-nav-bar-scaffold.widget.dart';
import 'package:scheme_package/scheme_package.dart';

PersistentTabController usePersistentController() => Hook.use(_ScrollControllerHook());

class _ScrollControllerHook extends Hook<PersistentTabController> {
	const _ScrollControllerHook();

	@override
	ScrollControllerHookState createState() => ScrollControllerHookState();
}

class ScrollControllerHookState
		extends HookState<PersistentTabController, _ScrollControllerHook> {
	PersistentTabController  _controller;

	@override
	void initHook() {
		_controller = PersistentTabController();

	}

	// Build doesn't return a Widget but rather the ScrollController
	@override
	PersistentTabController build(BuildContext context) => _controller;

	// This is what we came here for
	@override
	void dispose() =>_controller.dispose();
}