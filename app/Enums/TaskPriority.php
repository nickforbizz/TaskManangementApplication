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
}
