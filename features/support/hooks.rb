Before '@stripe' do
  StripeMock.start
end

After '@stripe' do
  StripeMock.stop
end