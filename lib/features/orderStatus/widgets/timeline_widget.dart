class TimeLineWidget {
  final String title;
  final String description;
  final String time;

  TimeLineWidget({
    required this.title,
    required this.description,
    required this.time,
  });
}

List<TimeLineWidget> status = [
  TimeLineWidget(
    title: 'Order Placed',
    description: 'We have received your order',
    time: '09 Sep 2024 11:32',
  ),
  TimeLineWidget(
    title: 'Waiting for Payments',
    description: 'We are Waiting for your Payments',
    time: '09 Sep 2024 11:32',
  ),
  TimeLineWidget(
    title: 'Payments received',
    description: 'Payments has been received',
    time: '09 Sep 2024 11:32',
  ),
  TimeLineWidget(
    title: 'Order Processed',
    description: 'Your order is being Processed',
    time: '09 Sep 2024 11:32',
  ),
  TimeLineWidget(
    title: 'Ready to Pickup',
    description: 'Your order is ready to be picked up by the courier',
    time: '09 Sep 2024 11:32',
  ),
  TimeLineWidget(
    title: 'Order Sent',
    description: 'Your order is being shipped by the courier',
    time: '09 Sep 2024 11:32',
  ),
  TimeLineWidget(
    title: 'Order Arrived',
    description: 'Your order has arrived',
    time: '09 Sep 2024 11:32',
  ),
  TimeLineWidget(
    title: 'Order Completed',
    description: 'Your order is completed',
    time: '09 Sep 2024 11:32',
  ),
];
