<?php
namespace App\Enums;

enum TaskStatus: int  {
    case TODO = 1;
    case IN_PROGRESS = 2;
    case COMPLETED = 3;
    case REVISION = 4;
    case ARCHIVED = 5;

    public function isTodo() : bool {
        return $this === self::TODO;
    }

    public function isInProgress() : bool {
        return $this === self::IN_PROGRESS;
    }

    public function isCompleted() : bool {
        return $this === self::COMPLETED;
    }

    public function isRevised() : bool {
        return $this === self::REVISION;
    }

    public function isArchived() : bool {
        return $this === self::ARCHIVED;
    }

    public function getLabelText(): string {
        return match ($this) {
            self::TODO => "Todo",
            self::IN_PROGRESS => "In Progress",
            self::COMPLETED => "Completed",
            self::REVISION => "Revision",
            self::ARCHIVED => "Archived",
        };
    }
}
