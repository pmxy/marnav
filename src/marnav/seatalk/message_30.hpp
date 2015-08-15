#ifndef __SEATALK__MESSAGE_30__HPP__
#define __SEATALK__MESSAGE_30__HPP__

#include "message.hpp"

namespace marnav
{
namespace seatalk
{

/// @brief Set Lamp Intensity
///
/// @code
/// 30 00 0X
///
///  X = 0: L0
///  X = 4: L1
///  X = 8: L2
///  X = C: L3
/// @endcode
///
/// only sent once when setting the lamp intensity
///
class message_30 : public message
{
public:
	constexpr static const message_id ID = message_id::set_lamp_intensity;

	enum class intensity : uint8_t { L0 = 0x00, L1 = 0x04, L2 = 0x08, L3 = 0x0c };

	message_30();
	message_30(const message_30 &) = default;
	message_30 & operator=(const message_30 &) = default;

	virtual raw get_data() const override;

	static std::unique_ptr<message> parse(const raw & data) throw(std::invalid_argument);

private:
	intensity value;

public:
	intensity get_intensity() const { return value; }

	void set_intensity(intensity t) { value = t; }
};
}
}

#endif