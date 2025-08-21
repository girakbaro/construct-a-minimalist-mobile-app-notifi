require 'ui'

class MinimalNotifier
  def initialize
    @notifications = []
  end

  def add_notification(message)
    @notifications << message
  end

  def display_notifications
    UI.alert(@notifications.join("\n"))
  end
end

describe MinimalNotifier do
  let(:notifier) { MinimalNotifier.new }

  it 'displays a single notification' do
    notifier.add_notification('Hello, World!')
    expect(UI).to receive(:alert).with('Hello, World!')
    notifier.display_notifications
  end

  it 'displays multiple notifications' do
    notifier.add_notification('Hello, World!')
    notifier.add_notification('This is another notification.')
    expect(UI).to receive(:alert).with("Hello, World!\nThis is another notification.")
    notifier.display_notifications
  end
end