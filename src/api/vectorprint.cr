require "../core/tensor"

module Bottle::B::Util
  extend self

  # This is a complete mess and needs to be redone, I was just
  # so tired of debugging ridiculously hard to read outputs
  # and this made my life so much easier.
  def vector_print(io, data : Tensor(U), prefix = "Tensor[", override_max = false, maxval : U = U.new(0)) forall U
    too_big = data.size > 1000

    longest = uninitialized U

    {% if U == Bool %}
      longest = false
    {% else %}
      longest = !override_max ? data.max.round(3) : maxval.round(3)
    {% end %}
    rj = "#{longest}".size + (U == Int32 || U == Bool ? 2 : 5)

    emptyp = " " * prefix.size

    lw = 75 - prefix.size
    epl = lw // rj
    nl = rj * data.size // lw + 1

    index = 0
    io << prefix

    if too_big
      3.times do |i| # ameba:disable Lint/UnusedArgument
        {% if U == Bool %}
          io << data[i].to_s.rjust(rj)
        {% else %}
          io << data[i].round(3).to_s.rjust(rj)
        {% end %}
      end
      io << "  ...  "
      3.times do |i| # ameba:disable Lint/UnusedArgument
        {% if U == Bool %}
          io << data[-(3 - i)].to_s.rjust(rj)
        {% else %}
          io << data[-(3 - i)].round(3).to_s.rjust(rj)
        {% end %}
      end
    else
      (nl + 1).times do |l| # ameba:disable Lint/UnusedArgument
        epl.times do |e|    # ameba:disable Lint/UnusedArgument
          if index < data.size
            {% if U == Bool %}
              io << data[index].to_s.rjust(rj)
            {% else %}
              io << data[index].round(3).to_s.rjust(rj)
            {% end %}
            index += 1
          end
        end
        if index < data.size
          io << "\n" << emptyp
        end
      end
    end
    io << "]"
  end
end
