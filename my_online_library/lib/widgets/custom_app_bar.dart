import 'package:flutter/material.dart';
import 'package:my_online_library/generated/l10n.dart';
import 'package:my_online_library/theme/theme_data.dart';

//ortak kullanılan appbar
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  final double radius;
  final bool showSearchBox; // Arama kutusunu göstermek için yeni bir özellik
  final TextEditingController? searchController; // Arama kutusu için kontrolcü
  final VoidCallback?
      onClearSearch; // Arama kutusunu temizlemek için geri çağırma

  const CustomAppBar({
    super.key,
    required this.title,
    this.height = 140.0, //  yükseklik
    this.radius = 35.0, //  köşe yuvarlama
    this.showSearchBox = false, // Varsayılan olarak arama kutusu kapalı
    this.searchController,
    this.onClearSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      decoration: BoxDecoration(
        color: const Color(0xff004d37), // AppBar arka plan rengi
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(radius),
        ),
      ),
      child: Column(
        children: [
          AppBar(
            foregroundColor: lightColorScheme.onPrimary,
            elevation: 0, // Gölgeyi kaldırmak için
            title: Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor:
                Colors.transparent, // AppBar arka plan rengini kaldır
          ),
          if (showSearchBox) // Arama kutusunu dinamik olarak göster
            PreferredSize(
              preferredSize: const Size.fromHeight(50.0),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: searchController,
                  style:
                      const TextStyle(color: Colors.black), // Metin rengi siyah
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white, // Arama kutusunun arka plan rengi
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: S.of(context).search,
                    hintStyle: const TextStyle(
                        color: Colors.grey), // Hint yazısı rengi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none, // Kenarlık görünümünü kaldır
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16.0),
                    suffixIcon: searchController?.text.isNotEmpty ?? false
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: onClearSearch,
                          )
                        : null,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height +
      (showSearchBox ? 50.0 : 0.0)); // Yüksekliği arama kutusuna göre ayarla
}
