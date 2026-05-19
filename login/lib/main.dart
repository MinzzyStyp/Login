import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

String taikhoan='luan';
String matkhau='123456';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

@override
Widget build(BuildContext context) {
  return const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  );
}
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

@override
State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController tenDangNhapController =TextEditingController();
  TextEditingController matKhauController =TextEditingController();

  void dangNhap(){
    String tenDangNhap = tenDangNhapController.text;
    String matkhau = matKhauController.text;
    
    if( tenDangNhap == taikhoan && matkhau == matkhau){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đăng nhập thành công'),
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TrangChu(),
          ),
        );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sai tên đăng nhập hoặc mật khẩu'),
        ),
      );
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('ĐĂNG NHẬP',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: tenDangNhapController,
              decoration: const InputDecoration(
                labelText: 'Tên đăng nhập',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox( height: 15),
            
            TextField(
              controller: matKhauController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Mật khẩu',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox( height: 20),
            ElevatedButton(
              onPressed: dangNhap,
              child: const Text('Đăng nhập'),
            ),
            TextButton(
              onPressed:() {},
              child: const Text('Quên mật khẩu'),
            ),
          ],
        ),
      ),
    );
  }
}
class TrangChu extends StatelessWidget{
  const TrangChu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'CHÀO MỪNG BẠN',
              style:TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Bạn đã đăng nhập thành công',
              style:TextStyle(
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed:() {
                Navigator.pop(context);
              },
              child: const Text('Đăng xuất'),
            ),
          ],
        ),
      ),
    );
  }
}