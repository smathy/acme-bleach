require "acme/bleach/version"

module Acme
  module Bleach
    Header = ( " \t" * 8 ) + "\n"
    WhiteChars = " \t"

    class << self
      def bleached? c
        !! c.match(/\A#{Header}/)
      end

      def whiten c
        Header + c.unpack( 'b*').join('').tr("01", WhiteChars)
      end

      def brighten c
        c.sub!(/\A#{Header}/, '') ? [ c.tr(WhiteChars, "01") ].pack('b*') : c
      end
    end

    content = File.read $0

    m = content.match %r{\A(?<before>.*)^(?<require>\s*require\s+(?<quote>['"])acme/bleach\k<quote>[^\n]*\n)(?<after>.*)\z}m

    before = m['before']
    req = m['require']
    after = m['after']

    if bleached? after
      eval before + brighten( after)
      exit
    else
      File.open $0, 'w' do |f|
        f.puts before + req + whiten( after)
      end
    end
  end
end
