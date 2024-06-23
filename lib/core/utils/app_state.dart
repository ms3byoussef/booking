part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class LanguageLoaded extends AppState {}

class ChangeLanguageState extends AppState{}

class AppLoading extends AppState{}

class GetHotels extends AppState{}

class CreateBooking extends AppState{}

class GetCompletedBooking extends AppState{}
class GetCancelledBooking extends AppState{}
class GetUpComingBooking extends AppState{}

class RefreshCompletedBooking extends AppState{}
class RefreshCancelledBooking extends AppState{}
class RefreshUpComingBooking extends AppState{}

class ErrorCompletedBooking extends AppState{}
class ErrorCancelledBooking extends AppState{}
class ErrorUpComingBooking extends AppState{}

class ErrorAppState extends AppState {
  final ServerException exception;

  ErrorAppState({
    required this.exception,
  });
}


class  GetFacilitiesLoadingState extends AppState{}
class  GetFacilitiesSuccessState extends AppState{}
class  SelectFacilityState extends AppState{}

class  SearchLoadingState extends AppState{}
class  SearchSuccessState extends AppState{}
