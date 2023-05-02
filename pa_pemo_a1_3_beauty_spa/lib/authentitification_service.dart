// import 'package:firebase_auth/firebase_auth.dart';
// import 'login_fix.dart';

// class SignInSignUp {
//   final User? user;
//   final String? message;
//   SignInSignUp({this.user, this.message});
// }

// class AuthService {
//   static Future<SignInSignUp?> registrasiUsingEmailPassword({
//     required String email,
//     required String password,
//   }) async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User? user;
//     String? pesan;

//     try {
//       UserCredential userCredential = await auth.createUserWithEmailAndPassword(
//         email: email, 
//         password: password
//       );

//       user = userCredential.user;
//       await user!.updateProfile(displayName: email);
//       await user.reload();
//       user = auth.currentUser;
//       return SignInSignUp(user: userCredential.user);
//     } on FirebaseAuthException catch (e) {
//       if(e.code == 'weak-password') {
//         print('Password Terlalu Lemah');
//         return SignInSignUp(message: "Password terlalu lemah!");
//       } else if (e.code == 'email-already-in-use') {
//         print('Telah  ada akun untuk emaill ini');
//         return SignInSignUp(message: "email already in use!");
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//   static Future<SignInSignUp?> signInUsingEmailPassword({
//     required String email,
//     required String password,
//   }) async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User? user;

//     try{
//       UserCredential userCredential = await auth.signInWithEmailAndPassword(
//         email: email, 
//         password: password
//       );
//       return SignInSignUp(user: userCredential.user);
//     } on FirebaseAuthException catch (e) {
//       if(e.code == 'user-not-found') {
//         return SignInSignUp(message: "No user found for that email");
//       } else if (e.code == 'wrong-password') {
//         return SignInSignUp(message: "Wrong Password Provided");
//       }
//     }
//   }
//   static Future<User?> refreshUser(User user) async {
//     FirebaseAuth auth = FirebaseAuth.instance;

//     await user.reload();
//     User? refreshedUser = auth.currentUser;

//     return refreshedUser;
//   }

//   static Future<void> signOut() async {
//     await FirebaseAuth.instance.signOut();

//     // return LoginPage();
//   }
// }
