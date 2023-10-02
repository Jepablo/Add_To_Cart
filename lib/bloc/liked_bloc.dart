
import 'dart:async';

import 'package:add_to_cart/Event/liked_event.dart';
import 'package:add_to_cart/data/cart_item.dart';
import 'package:add_to_cart/state/like_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Event/cart_event.dart';
import '../data/liked_item.dart';
import '../state/cart_state.dart';

class LikeBloc extends Bloc<LikedEvent,LikeState> {
  LikeBloc() : super(LikeInitial()) {
    //events
    on<LikedInitialEvent>(likedInitialEvent);
    on<LikedRemoveEvent>(likedRemoveEvent);
  }

  FutureOr<void> likedInitialEvent(LikedInitialEvent event, Emitter<LikeState> emit) {
    emit(LikeSuccessState(likeItems: likedItems));
  }

  FutureOr<void> likedRemoveEvent(LikedRemoveEvent event, Emitter<LikeState> emit) {
    likedItems.remove(event.groceryDataModel);
    emit(LikeSuccessState(likeItems: likedItems));
    }
  }



