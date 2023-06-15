import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore fireStore = FirebaseFirestore.instance;
User? currenUser = auth.currentUser;

//collections
const usersCollection = "users";
const productsCollection = "products";
const cartCollection = "cart";
const chatsCollection = 'chats';
const messagescollection = 'messages';

const ordersCollection = 'orders';