// import 'dart:typed_data';
// import 'package:win32/win32.dart';
// import 'package:image/image.dart' as img;

// /// 擷取指定視窗（依視窗標題）
// Uint8List captureWindow(String windowTitle) {
//   // 1. 取得視窗 Handle
//   final hwnd = FindWindow(, TEXT(windowTitle));
//   if (hwnd == 0) {
//     throw Exception('找不到視窗');
//   }

//   // 2. 取得視窗大小
//   final rect = callo<RECT>();
//   GetWindowRect(hwnd, rect);
//   final width = rect.ref.right - rect.ref.left;
//   final height = rect.ref.bottom - rect.ref.top;

//   // 3. 建立 DC
//   final hdcWindow = GetDC(hwnd);
//   final hdcMem = CreateCompatibleDC(hdcWindow);
//   final hBitmap = CreateCompatibleBitmap(hdcWindow, width, height);
//   SelectObject(hdcMem, hBitmap);

//   // 4. 複製畫面
//   BitBlt(
//     hdcMem,
//     0,
//     0,
//     width,
//     height,
//     hdcWindow,
//     0,
//     0,
//     SRCCOPY,
//   );

//   // 5. 轉成 Bitmap 資料
//   final bmpHeader = calloc<BITMAPINFO>();
//   bmpHeader.ref.bmiHeader.biSize = sizeOf<BITMAPINFOHEADER>();
//   bmpHeader.ref.bmiHeader.biWidth = width;
//   bmpHeader.ref.bmiHeader.biHeight = -height;
//   bmpHeader.ref.bmiHeader.biPlanes = 1;
//   bmpHeader.ref.bmiHeader.biBitCount = 32;
//   bmpHeader.ref.bmiHeader.biCompression = BI_RGB;

//   final buffer = calloc<Uint8>(width * height * 4);
//   GetDIBits(
//     hdcMem,
//     hBitmap,
//     0,
//     height,
//     buffer,
//     bmpHeader,
//     DIB_RGB_COLORS,
//   );

//   // 6. 轉 PNG
//   final image = img.Image.fromBytes(
//     width: width,
//     height: height,
//     bytes: buffer.asTypedList(width * height * 4).buffer,
//     format: img.Format.bgra,
//   );

//   // 清理資源
//   DeleteObject(hBitmap);
//   DeleteDC(hdcMem);
//   ReleaseDC(hwnd, hdcWindow);
//   calloc.free(rect);
//   calloc.free(buffer);
//   calloc.free(bmpHeader);

//   return Uint8List.fromList(img.encodePng(image));
// }
