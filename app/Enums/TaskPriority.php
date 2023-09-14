<?php
namespace App\Enums;

enum TaskPriority: int  {
    case LOW = 1;
    case MEDIUM = 2;
    case HIGH = 3;

    public function isLow() : bool {
        return $this === self::LOW;
    }

    public function isMedium() : bool {
        return $this === self::MEDIUM;
    }

    public function isHigh() : bool {
        return $this === self::HIGH;
    }


    public function getLabelText(): string {
        return match ($this) {
            self::LOW => "Low",
            self::MEDIUM => "Medium",
            self::HIGH => "High",
        };
    }

    public function getLabelVal(): string {
        return match ($this) {
            self::LOW => 1,
            self::MEDIUM => 2,
            self::HIGH => 3,
        };
    }

    public static function values(): array
    {
        return array_column(self::cases(), 'name', 'value');
    }
}
