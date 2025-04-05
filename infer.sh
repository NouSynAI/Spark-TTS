#!/bin/bash

# Copyright (c) 2025 SparkAudio
#               2025 Xinsheng Wang (w.xinshawn@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


# Get the absolute path of the script's directory
script_dir=$(dirname "$(realpath "$0")")

# Get the root directory
root_dir=$(dirname "$script_dir")

# Set default parameters
device=0
save_dir='results'
model_dir="pretrained_models/Spark-TTS-0.5B"
text="Alright, alright, alright. Life’s a wild ride full of unexpected twists and turns that challenge our very core. When you stand at the edge of the unknown, it’s in those moments that you truly discover who you are. Embrace every step with passion, let your heart lead the way, and trust that the journey will reveal its beauty in time. Remember, every challenge is an opportunity to grow and every setback a chance to rise stronger. So, take a deep breath, lean into the adventure, and let the rhythm of life carry you forward."
prompt_text="Forward from the author. Before we begin the march forward, a note. This article is laced with metaphors. You'll find trenches, flags, no man's land, and other echoes from the battlefields of history. These are intentional. They are here to carry the weight of what we are really talking about. And while none of this is literal, the stories underneath, the ones about AI engineers, about builders, about the quiet foot soldiers of modern technology are very real. Some of these metaphors will only make sense if you read them with a certain level of emotional intelligence. If you don't get it, that's not a bug. It's a feature. This article is written for those who've been in the trenches, who've pushed through uncertainty. Fog and failure. It's written for builders. If you're here for buzzwords, this isn't your parade. Section one. Some of us don't build because we have to. It's four AM. Your AWS account balance is shrinking. Your heart's racing like a war drum. Your body is screaming for rest, and still, you're tearing down another failed deployment because some broken abstraction or some forgotten dependency just exploded your pipeline. Your inbox is empty. Nobody is watching. But you are here in the trenches wrestling with the problem. Not for applause, not for recognition, but because solving it feels like the only thing left in this world worth doing. We build because there's something inside us that refuses to settle. We are not the ones writing carousel posts. We are the ones holding broken code bases together with duct tape and sheer determination. We are the ones tuning hyperparameters in the dead of night, reworking orchestration logic by hand, fighting serverless environments designed by someone who's never once fought in no man's land. We are the trench takers, the spearheads, the pathfinders, the ones who move alone in the fog. Without a map, without a guaranteed backup, and without anyone clearing the barbed wire ahead of us. This article is a letter from the trenches. It's a battle cry for the engineers who still pay for their own tools, who still patch production problems out of sheer willpower, who still believe there is honor in doing hard things because they are hard. Again, if you don't feel this weight, if this fog doesn't look familiar, this article might not be for you. But if you know the mud, if you know the silence of the midnight commits, if you've ever spent your own dime to finish the fight before Monday morning, you're exactly who this is written for. We do it because it is hard. We do it because no one else will. We do it because this is who we are."
prompt_speech_path="VoiceCloneSample.wav"

# Change directory to the root directory
cd "$root_dir" || exit


# Run inference
python3 -m cli.inference \
    --text "${text}" \
    --device "${device}" \
    --save_dir "${save_dir}" \
    --model_dir "${model_dir}" \
    --prompt_text "${prompt_text}" \
    --prompt_speech_path "${prompt_speech_path}"
    
    