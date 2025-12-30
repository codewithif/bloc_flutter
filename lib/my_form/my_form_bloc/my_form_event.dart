abstract class MyFormEvent {}
class SwitchEvent extends MyFormEvent{
  final bool isSwitched;
  SwitchEvent({required this.isSwitched});
}
class SliderEvent extends MyFormEvent{
  final double SliderValue;
  SliderEvent({required this.SliderValue});
}