import 'package:flutter_bloc/flutter_bloc.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc() : super(ExploreState()) {
    on<ExploreEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}