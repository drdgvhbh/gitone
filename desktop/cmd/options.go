package main

import (
	"github.com/go-flutter-desktop/go-flutter"
	"github.com/go-flutter-desktop/plugins/file_picker"
	"github.com/go-flutter-desktop/plugins/shared_preferences"
)

var options = []flutter.Option{
	flutter.WindowInitialDimensions(800, 1280),
	flutter.AddPlugin(&file_picker.FilePickerPlugin{
		VendorName: "drdgvhbh",
		ApplicationName: "gitone",
	}),
	flutter.AddPlugin(&shared_preferences.SharedPreferencesPlugin{
		VendorName: "drdgvhbh",
		ApplicationName: "gitone",
	}),
	//flutter.AddPlugin(&path_provider.PathProviderPlugin{
	//	VendorName:      "myOrganizationOrUsername",
	//	ApplicationName: "myApplicationName",
	//}),
}
 